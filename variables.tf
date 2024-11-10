variable "project_id" {
  description = "GCP Project ID"
  default     = "trusty-wavelet-441019-i7"
}

variable "region" {
  description = "GCP Region"
  default     = "us-west1"
}

variable "zone" {
  description = "GCP Zone"
  default     = "us-west1-a"
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
  description = "Path to the GCP credentials file"
  default     = "/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json"
}

variable "github_index_html_url" {
  description = "GitHub URL for index.html"
  default     = "https://github.com/varahipratyangira/static-html-webpage/blob/main/index.html"
}

variable "main_page_suffix" {
  description = "Main page suffix for the static website"
  default     = "index.html"
}

variable "not_found_page" {
  description = "Not found page for the static website"
  default     = "404.html"
}

variable "log_object_prefix" {
  description = "Prefix for access logs"
  default     = "website-access-logs/"
}

variable "front_end_port" {
  description = "Port for the HTTP Load Balancer"
  default     = "80"
}

variable "force_destroy" {
  description = "Whether to force destroy resources"
  default     = true
}

variable "additional_files" {
  description = "List of additional files to upload"
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to additional files to upload"
  default     = []
}
