/* output "service-account" {
  value = module.createServiceAccount.service-account
} */

output "GCP-bucket-name" {
  value = module.createBucket.backup-bucket-name
}