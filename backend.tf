terraform {
  backend "gcs" {
    bucket = var.gcp_bucket_name
    prefix = "terraform/state"
  }
}
