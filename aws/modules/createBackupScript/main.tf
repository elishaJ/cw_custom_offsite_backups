resource "null_resource" "backupScript" {
  provisioner "local-exec" {
    command = <<-EOT
      cp ../scripts/aws_backup_script.sh "${path.root}/backup_script.sh"
      sed -i 's|s3://<enter-bucket-name>|s3://${var.cways-bucket-name}|g' "${path.root}/backup_script.sh"
    EOT
  }
}