terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.7.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.28.0"
    }
  }
  
  backend "gcs" {
    bucket  = "terraform-state-bucket-24"
    prefix  = "terraform_projects/cloudways_backups/terraform.tfstate"
    project = var.project-name
  }
}

provider "google" {
  # Configuration options
  # credentials = ""
  # project     = var.project-name
  # region      = var.region
  # zone        = var.zone
}
