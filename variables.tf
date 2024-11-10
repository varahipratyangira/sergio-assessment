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
  default     = "us-west1a"
}

variable "location" {
  description = "Location for the GCP buckets"
  default     = "US"
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials JSON file"
  default     = "/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json"
}

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
  default     = "rga-sergio-assessment-bucket"
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
  default     = "rga-sergio-assessment-access-logs"
}

variable "main_page_suffix" {
  description = "Main page suffix for the static website"
  default     = "index.html"
}

variable "not_found_page" {
  description = "Not found page for the static website"
  default     = "404.html"
}

# Load Balancer Variables
variable "backend_bucket_name" {
  description = "Name of the backend bucket for load balancer"
  default     = "website-backend-bucket"
}

variable "url_map_name" {
  description = "Name of the URL map"
  default     = "website-url-map"
}

variable "http_proxy_name" {
  description = "Name of the HTTP proxy"
  default     = "http-proxy"
}

variable "load_balancer_name" {
  description = "Name of the load balancer"
  default     = "http-forwarding-rule"
}

variable "load_balancer_port" {
  description = "Port for the load balancer to handle requests"
  default     = "80"
}

variable "enable_cdn" {
  description = "Enable CDN for the backend bucket"
  default     = true
}
