terraform {
  backend "gcs" {
    bucket = env.GCP_TF_BUCKET
    prefix = "terraform/state"
  }
}
