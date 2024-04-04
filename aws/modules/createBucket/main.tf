resource "aws_s3_bucket" "cways-backup-bucket" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "backup_bucket_versioning" {
  bucket = aws_s3_bucket.cways-backup-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "backup-bucket-name" {
	value = aws_s3_bucket.cways-backup-bucket.id
}

output "backup-bucket-arn" {
	value = aws_s3_bucket.cways-backup-bucket.arn
}