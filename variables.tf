variable "project_id" {
  description = "The project ID in Google Cloud"
  type        = string
}

variable "region" {
  description = "The GCP region for resources"
  type        = string
}

variable "location" {
  description = "Location for the buckets"
  type        = string
}

variable "website_bucket_name" {
  description = "The name for the static website bucket"
  type        = string
}

variable "access_logs_bucket_name" {
  description = "The name for the access logs bucket"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to the GCP service account credentials JSON file"
  type        = string
}

variable "github_index_html_url" {
  description = "URL for the static HTML webpage hosted on Github"
  type        = string
}
