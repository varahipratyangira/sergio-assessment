variable "project_id" {
  description = "GCP Project ID"
  default     = "rga-assessment"
}

variable "region" {
  description = "GCP Region"
  default     = "us-west1"
}

variable "location" {
  description = "Location for the GCP buckets"
  default     = "US-WEST1"
}

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
  default     = "rga-assessment"
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
  default     = "rga-assessment-access-logs"
}
