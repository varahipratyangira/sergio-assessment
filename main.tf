provider "google" {
  project = var.project_id
  region  = var.region
}

# Website Bucket for Static Content
resource "google_storage_bucket" "website_bucket" {
  name                        = var.website_bucket_name
  location                    = var.location
  force_destroy               = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  uniform_bucket_level_access = true

  logging {
    log_bucket        = google_storage_bucket.access_logs_bucket.name
    log_object_prefix = "website-access-logs/"
  }
}

# Access Logs Bucket
resource "google_storage_bucket" "access_logs_bucket" {
  name          = var.access_logs_bucket_name
  location      = var.location
  force_destroy = true
  uniform_bucket_level_access = true
}

# Other resources (Backend bucket, load balancer configuration, etc.) remain the same...
