variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Region"
}

variable "zone" {
  description = "GCP Zone"
}

variable "location" {
  description = "Location for the GCP buckets"
}

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
}

variable "gcp_credentials_file" {
  description = "Path to GCP credentials file"
}

variable "index_html_path" {
  description = "Path to index.html file for static website"
}

variable "not_found_html_path" {
  description = "Path to 404.html file for static website"
}

variable "additional_files" {
  description = "List of additional files to upload"
  type        = list(string)
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to additional files"
  type        = list(string)
  default     = []
}

# Load Balancer Configurable Variables
variable "backend_bucket_name" {
  description = "Name of the backend bucket for the load balancer"
  default     = "website-backend"
}

variable "url_map_name" {
  description = "Name of the URL map for the load balancer"
  default     = "website-url-map"
}

variable "http_proxy_name" {
  description = "Name of the HTTP proxy for the load balancer"
  default     = "website-http-proxy"
}

variable "forwarding_rule_name" {
  description = "Name of the forwarding rule for the load balancer"
  default     = "website-forwarding-rule"
}

variable "http_port" {
  description = "Port for HTTP traffic"
  default     = "80"
}
