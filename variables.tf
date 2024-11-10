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

variable "gcp_credentials_file" {
  description = "Path to the GCP service account credentials file"
  default     = "/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json"
}

variable "website_bucket_name" {
  description = "Base name for the bucket to host the static website"
  default     = "rga-sergio-assessment-bucket"
}

variable "access_logs_bucket_name" {
  description = "Base name for the bucket to store access logs"
  default     = "rga-sergio-assessment-access-logs"
}

variable "index_html_url" {
  description = "URL of the public GitHub repository for the index.html"
  default     = "https://github.com/varahipratyangira/static-html-webpage/raw/main/index.html"
}

variable "additional_files" {
  description = "List of additional files to upload"
  type        = list(string)
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to additional files to upload"
  type        = list(string)
  default     = []
}

variable "load_balancer_name" {
  description = "Name of the HTTP Load Balancer"
  default     = "website-http-lb"
}
