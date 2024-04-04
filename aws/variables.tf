variable "CW_API_KEY" {
  description = "Cloudways API key for server deployment"
  sensitive = true
}

variable "CW_EMAIL" {
  type        = string
  # default     = "elisha.jamil@cloudways.com"
  description = "Cloudways primary account email"
}

variable "region" {
  type        = string
  # default     = "us-central1"
  default = "us-east-1"
  description = "Default region for AWS"
}
