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
  
  backend "s3" {
    bucket = "cloudways-terraform-state-1810"
    key    = "cloudways_backups/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-backend-lock-table"
    encrypt = true
    # profile = "default"
  }
}

provider "google" {
  # Configuration options
  # credentials = ""
  # project     = var.project-name
  # region      = var.region
  # zone        = var.zone
}
