variable "CW_API_KEY" {
  description = "Cloudways API key for server deployment"
  sensitive = true
}

variable "CW_EMAIL" {
  type        = string
  # default     = "elisha.jamil@cloudways.com"
  description = "Cloudways primary account email"
}

variable "GOOGLE_CREDENTIALS" {
  type = string
  default = "/home/ali/my_projects/cw_custom_offsite_backups/gcp/.auth/cw-automations-29aec829be0d.json"
  description = "GCP service account key for terraform authentication"
}

variable "project-name" {
  type        = string
  default     = "cw-automations"
  description = "The name of the GCP project in which the resources will be created"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Default region for GCP project"
}

variable "zone" {
  type        = string
  default     = "us-central1-c"
  description = "Default zone for GCP project"
}