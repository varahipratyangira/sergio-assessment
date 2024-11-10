provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.gcp_credentials_file)
}

# Generate a unique suffix for the bucket names
resource "random_id" "unique_suffix" {
  byte_length = 8
}

# Define a common bucket configuration
locals {
  bucket_suffix = random_id.unique_suffix.hex
  bucket_name_access_logs = lower("${var.access_logs_bucket_name}-${local.bucket_suffix}")
  bucket_name_website = lower("${var.website_bucket_name}-${local.bucket_suffix}")
}

# Access Logs Bucket (valid GCP bucket name)
resource "google_storage_bucket" "access_logs_bucket" {
  name                        = local.bucket_name_access_logs
  location                    = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

# Website Bucket for Static Content (valid GCP bucket name)
resource "google_storage_bucket" "website_bucket" {
  name                        = local.bucket_name_website
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
}