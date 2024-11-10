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

variable "website_bucket_name" {
  description = "Name of the bucket to host the static website"
  default     = "rga-bucket"
}

variable "access_logs_bucket_name" {
  description = "Name of the bucket for storing access logs"
  default     = "rga-access-logs"
}
