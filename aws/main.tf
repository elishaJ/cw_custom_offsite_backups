# Module for creating s3 bucket for offsite backup storage
module "createBucket" {
  source       = "./modules/createBucket"
}

locals {
  bucket_name = module.createBucket.backup-bucket-name
  bucket-arn  = module.createBucket.backup-bucket-arn
}

# Module for creating GCP Service Account
module "createServiceAccount" {
  source            = "./modules/createServiceAccount"
  cways-bucket-name = local.bucket_name
  cways-bucket-arn = local.bucket-arn
}

# Module for creating backup script
module "createBackupScript" {
  source            = "./modules/createBackupScript"
  cways-bucket-name = local.bucket_name
}

# Module for creating server
module "createServer" {
  source = "./modules/createServer"
  CW_API_KEY = var.CW_API_KEY
}