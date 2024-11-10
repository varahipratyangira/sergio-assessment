variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-west1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-west1-a"
}

variable "location" {
  description = "Location for the GCP buckets"
  type        = string
  default     = "US"
}

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
  type        = string
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials JSON file"
  type        = string
}

variable "github_index_html_url" {
  description = "URL of the index.html file in your GitHub repository"
  type        = string
}

variable "additional_files" {
  description = "List of additional files to upload to the website bucket"
  type        = list(string)
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to the additional files to upload"
  type        = list(string)
  default     = []
}
