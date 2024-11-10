variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP Region"
}

variable "zone" {
  description = "GCP Zone"
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials JSON file"
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

variable "main_page_suffix" {
  description = "Main page suffix for the website"
  default     = "index.html"
}

variable "not_found_page" {
  description = "404 not found page for the website"
  default     = "404.html"
}

variable "log_object_prefix" {
  description = "Prefix for log objects in the access logs bucket"
  default     = "website-access-logs/"
}

variable "index_html_path" {
  description = "Path to the index.html file"
}

variable "not_found_html_path" {
  description = "Path to the 404.html file"
}

variable "backend_bucket_name" {
  description = "Name of the backend bucket for the load balancer"
}

variable "url_map_name" {
  description = "Name of the URL map for the load balancer"
}

variable "http_proxy_name" {
  description = "Name of the HTTP proxy for the load balancer"
}

variable "forwarding_rule_name" {
  description = "Name of the global forwarding rule for the load balancer"
}

variable "http_port" {
  description = "Port for the HTTP traffic"
  default     = "80"
}
