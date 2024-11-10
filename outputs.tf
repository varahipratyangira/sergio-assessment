output "access_logs_bucket" {
  description = "Self link to the access logs bucket"
  value       = google_storage_bucket.access_logs_bucket.self_link
}

output "access_logs_bucket_name" {
  description = "Name of the access logs bucket"
  value       = google_storage_bucket.access_logs_bucket.name
}

output "website_bucket" {
  description = "Self link to the website bucket"
  value       = google_storage_bucket.website_bucket.self_link
}

output "website_bucket_name" {
  description = "Name of the website bucket"
  value       = google_storage_bucket.website_bucket.name
}

output "website_url" {
  description = "URL of the website"
  value       = "http://${google_storage_bucket.website_bucket.name}.storage.googleapis.com"
}

output "load_balancer_url" {
  description = "URL of the front-end HTTP load balancer"
  value       = "http://${google_compute_global_forwarding_rule.website_forwarding_rule.ip_address}:${var.load_balancer_frontend_port}"
}
