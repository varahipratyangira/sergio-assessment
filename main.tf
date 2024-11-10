# Provider configuration for Google Cloud
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

  acl {
    role   = "READER"
    entity = "allUsers"
  }

  depends_on = [google_storage_bucket.access_logs_bucket]
}

# Upload static website files (index.html, 404.html)
resource "google_storage_object" "index_html" {
  name          = "index.html"
  bucket        = google_storage_bucket.website_bucket.name
  source        = var.index_html_path
  content_type  = "text/html"
}

resource "google_storage_object" "not_found_html" {
  name          = "404.html"
  bucket        = google_storage_bucket.website_bucket.name
  source        = var.not_found_html_path
  content_type  = "text/html"
}

# HTTP Load Balancer Setup
resource "google_compute_backend_bucket" "website_backend" {
  name        = var.backend_bucket_name
  bucket_name = google_storage_bucket.website_bucket.name
}

resource "google_compute_url_map" "website_url_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_bucket.website_backend.self_link
}

resource "google_compute_target_http_proxy" "website_http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.website_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "website_forwarding_rule" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.website_http_proxy.self_link
  port_range = var.http_port
}
