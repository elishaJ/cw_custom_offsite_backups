variable "project-name" {
  type        = string
  default     = "cw-custom-offsite-backups"
  description = "The name of the GCP project in which the service account will be created"
}

variable "cways-bucket-name" {
  type = string
}
