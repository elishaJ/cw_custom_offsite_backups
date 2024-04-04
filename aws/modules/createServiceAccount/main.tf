resource "aws_iam_user" "iam_user" {
    name = "terraform-custom-backups-iam-user"
}

resource "aws_iam_access_key" "access_key" {
    user = aws_iam_user.iam_user.name
}

data "aws_iam_policy_document" "allow_backup_bucket_access" {
    statement {
        actions = [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
        ]

    resources = [
        var.cways-bucket-arn,
        "${var.cways-bucket-arn}/*",
    ]
}
}

resource "aws_iam_user_policy" "policy" {
    name   = "terraform-custom-backups-user-policy"
    user   = aws_iam_user.iam_user.name
    policy = data.aws_iam_policy_document.allow_backup_bucket_access.json
}

# resource "local_file" "aws_credentials" {
#     content         = <<-EOT
#         [default]
#         aws_access_key_id     = "${aws_iam_access_key.access_key.id}"
#         aws_secret_access_key = "${aws_iam_access_key.access_key.secret}"
#     EOT
#     filename        = "${path.root}/.aws_credentials"
#     file_permission = "0600"
# }

resource "local_file" "aws_credentials" {
    content         = <<-EOT
        [default]
        aws_access_key_id     = "${aws_iam_access_key.access_key.id}"
        aws_secret_access_key = "${aws_iam_access_key.access_key.secret}"
    EOT
    filename        = "${path.root}/.aws_credentials"
    file_permission = "0600"
}


