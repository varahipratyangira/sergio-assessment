variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-west1"
}

variable "location" {
  description = "Location for resources"
  type        = string
  default     = "US"
}

variable "website_bucket_name" {
  description = "Name for the website bucket"
  type        = string
}

variable "access_logs_bucket_name" {
  description = "Name for the access logs bucket"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to GCP service account credentials file"
  type        = string
}

variable "github_index_html_url" {
  description = "URL for the static HTML page (index.html) hosted on GitHub"
  type        = string
}

variable "additional_files" {
  description = "List of other files to upload to the bucket"
  type        = list(string)
  default     = []
}

variable "additional_files_paths" {
  description = "Paths for additional files to upload to the bucket"
  type        = list(string)
  default     = []
}
