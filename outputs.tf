output "access_logs_bucket" {
  description = "Self link to the access logs bucket"
  value       = google_storage_bucket.access_logs_bucket.self_link
}

output "website_bucket" {
  description = "Self link to the website bucket"
  value       = google_storage_bucket.website_bucket.self_link
}

output "website_url" {
  description = "URL of the website"
  value       = "http://${google_storage_bucket.website_bucket.name}.storage.googleapis.com"
}

output "backend_bucket_name" {
  description = "Name of the backend bucket used in the load balancer"
  value       = google_compute_backend_bucket.website_backend.name
}

output "forwarding_rule" {
  description = "Name of the global forwarding rule"
  value       = google_compute_global_forwarding_rule.website_forwarding_rule.name
}
