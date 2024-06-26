variable "CW_API_KEY" {
  description = "Cloudways API key path for server deployment"
}

variable "cloudways-email" {
  type        = string
  default     = "elisha.jamil@cloudways.com"
  description = "Cloudways primary account email"
}

variable "cloud" {
  type        = string
  default     = "do"
  description = "The cloud provider (e.g., do for DigitalOcean)"
}

variable "server_region" {
  type        = string
  default     = "lon1"
  description = "The server region (e.g., nyc3)"
}

variable "instance_type" {
  type        = string
  default     = "1GB"
  description = "The instance type (e.g., 1GB)"
}

variable "app_type" {
  type        = string
  default     = "wordpress"
  description = "The application type (e.g., wordpress, magento, laravel, etc.)"
}

variable "app_version" {
  type        = string
  default     = "6.1"
  description = "The application version (e.g., 6.1)"
}

variable "server_label" {
  type        = string
  default     = "my-TF-server"
  description = "The server label (e.g., terraform-server)"
}

variable "app_label" {
  type        = string
  default     = "my-TF-gcp-app"
  description = "The application label (e.g., TF-app)"
}

variable "backup_time" {
  type = string
  default = "00:00"
}

variable "backup_retention" {
  type = string
  default = "8"
}

variable "backup_frequency" {
  type = string
  default = "1"
}

variable "local_backups" {
  type = bool
  default = true
}
