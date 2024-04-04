terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.7.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = var.project-name
  # region      = var.region
  # zone        = var.zone
}