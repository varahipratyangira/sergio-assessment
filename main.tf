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
    main_page_suffix = var.main_page_suffix
    not_found_page   = var.not_found_page
  }

  logging {
    log_bucket        = google_storage_bucket.access_logs_bucket.name
    log_object_prefix = "website-access-logs/"
  }

  depends_on = [google_storage_bucket.access_logs_bucket]
}

# Backend bucket for the load balancer
resource "google_compute_backend_bucket" "website_backend" {
  name        = var.backend_bucket_name
  bucket_name = google_storage_bucket.website_bucket.name
  enable_cdn  = var.enable_cdn
}

# URL map to route requests to the backend bucket
resource "google_compute_url_map" "website_url_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_bucket.website_backend.self_link
}

# HTTP proxy for handling frontend traffic
resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.website_url_map.self_link
}

# Global forwarding rule to route requests to the load balancer
resource "google_compute_global_forwarding_rule" "http_rule" {
  name        = var.load_balancer_name
  target      = google_compute_target_http_proxy.http_proxy.self_link
  port_range  = var.load_balancer_port
  ip_protocol = "TCP"
}
