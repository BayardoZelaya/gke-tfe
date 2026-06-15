terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=7.30"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.2.0"
    }
  }
}
