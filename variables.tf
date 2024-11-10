variable "project_id" {
  description = "The GCP Project ID"
  type        = string
  default     = "trusty-wavelet-441019-i7"  # Replace with your actual project ID
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-west1"  # Specify the desired GCP region
}

variable "location" {
  description = "The location for the resources"
  type        = string
  default     = "US"  # Set the location identifier (US in this case)
}

variable "website_bucket_name" {
  description = "Name of the website bucket"
  type        = string
  default     = "rga-sergio-assessment-bucket"  # Name for the website bucket
}

variable "access_logs_bucket_name" {
  description = "Name of the access logs bucket"
  type        = string
  default     = "rga-sergio-assessment-access-logs"  # Name for the access logs bucket
}

variable "gcp_credentials_file" {
  description = "Path to the GCP service account credentials file"
  type        = string
  default     = "/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json"  # Path to your GCP credentials file
}

variable "github_index_html_url" {
  description = "URL for the static HTML webpage hosted on GitHub"
  type        = string
  default     = "https://github.com/varahipratyangira/static-html-webpage/raw/main/index.html"  # GitHub URL for the static HTML
}

variable "zone" {
  description = "The zone for GCP resources"
  type        = string
  default     = "us-west1-a"
}

variable "additional_files" {
  description = "List of additional files to upload to the website bucket"
  type        = list(string)
  default     = []
}

variable "additional_files_paths" {
  description = "Paths to the additional files"
  type        = list(string)
  default     = []
}
