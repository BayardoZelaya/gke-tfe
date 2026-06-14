terraform {
  backend "gcs" {
    bucket = "tfe-backend"
    prefix = "terraform/bootstrap"
  }
}

provider "google" {
  project = var.project_id
}
