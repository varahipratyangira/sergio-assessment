project_id             = "your-gcp-project-id"
region                 = "us-west1"
zone                   = "us-west1a"
location               = "US"
website_bucket_name    = "your-website-bucket-name"
access_logs_bucket_name = "your-access-logs-bucket-name"
gcp_credentials_file   = "/path/to/your/gcp/credentials.json"
index_html_path        = "/path/to/index.html"
not_found_html_path    = "/path/to/404.html"
additional_files       = ["file1.html", "file2.css"]
additional_files_paths = ["/path/to/file1.html", "/path/to/file2.css"]

# Load Balancer Configurations
backend_bucket_name    = "my-website-backend"
url_map_name           = "my-website-url-map"
http_proxy_name        = "my-website-http-proxy"
forwarding_rule_name   = "my-website-forwarding-rule"
http_port              = "80"
