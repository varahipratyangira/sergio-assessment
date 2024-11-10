variable "project_id" {
  description = "GCP Project ID"
  default     = "trusty-wavelet-441019-i7"  # Update based on your needs
}

variable "region" {
  description = "GCP Region"
  default     = "us-west1"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-west1a"
}

variable "location" {
  description = "Location for the GCP buckets"
  default     = "US"
}

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
  default     = "rga-sergio-assessment-bucket"
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
  default     = "rga-sergio-assessment-access-logs"
}

variable "gcp_credentials_file" {
  description = "Path to GCP credentials JSON file"
  default     = "/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json"
}

variable "index_html_path" {
  description = "Path to index.html file for the website"
  default     = "./index.html"
}

variable "not_found_html_path" {
  description = "Path to 404.html file for the website"
  default     = "./404.html"
}

variable "additional_files" {
  description = "List of additional files to upload"
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to additional files to upload"
  default     = []
}
