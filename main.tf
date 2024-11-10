provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.gcp_credentials_file)
  zone        = var.zone
}

# Access Logs Bucket
resource "google_storage_bucket" "access_logs_bucket" {
  name                        = var.access_logs_bucket_name
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

# Website Bucket for Static Content
resource "google_storage_bucket" "website_bucket" {
  name                        = var.website_bucket_name
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  logging {
    log_bucket        = google_storage_bucket.access_logs_bucket.name
    log_object_prefix = "website-access-logs/"
  }

  depends_on = [google_storage_bucket.access_logs_bucket]
}

# Upload static website files (index.html, 404.html)
resource "google_storage_bucket_object" "index_html" {
  name          = "index.html"
  bucket        = google_storage_bucket.website_bucket.name
  source        = "index.html"  # Local file path (downloaded before apply)
  content_type  = "text/html"
}

# HTTP Load Balancer Setup
resource "google_compute_backend_bucket" "website_backend" {
  name        = "website-backend"
  bucket_name = google_storage_bucket.website_bucket.name
}

resource "google_compute_url_map" "website_url_map" {
  name            = "website-url-map"
  default_service = google_compute_backend_bucket.website_backend.self_link
}

resource "google_compute_target_http_proxy" "website_http_proxy" {
  name    = "website-http-proxy"
  url_map = google_compute_url_map.website_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "website_forwarding_rule" {
  name       = "website-forwarding-rule"
  target     = google_compute_target_http_proxy.website_http_proxy.self_link
  port_range = var.load_balancer_frontend_port
}

# Optional: Upload additional files (if needed)
resource "google_storage_bucket_object" "additional_files" {
  count         = length(var.additional_files)
  name          = element(var.additional_files, count.index)
  bucket        = google_storage_bucket.website_bucket.name
  source        = element(var.additional_files_paths, count.index)
  content_type  = "text/html"
}
