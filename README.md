<div align="center">
<a href="https://softflow.ca/"><img src="https://softflow.ca/wp-content/uploads/2022/06/anima02-03-2.gif" alt="Masterhead"></a>
</div>

<h1 align="center">Custom Offsite Backups on Cloudways</h1>

Welcome to the Cloudways Custom Offsite Backups repository! This repository focuses on enhancing data security for Cloudways accounts by offering custom offsite backup solutions tailored for AWS and Google Cloud.

### Folders
**aws**: 
 The "AWS" folder contains Terraform code designed to set up remote Cloudways backups on AWS S3 buckets. This allows for seamless integration with Amazon Web Services for secure offsite storage of your Cloudways backups.
 
**gcp**:
 In the "GCP" folder, you'll find resources for setting up Cloudways backups on Google Cloud Platform (GCP) using Google Storage buckets. This enables you to leverage the robust infrastructure of Google Cloud for storing your backups securely offsite.
 
**scripts**:
The "Scripts" folder houses templates for backup scripts for both AWS and Google Cloud. These scripts provide additional flexibility and customization options for managing your Cloudways backups according to your specific requirements.

### Roadmap
- [x]  Custom terraform provisioner for Cloudways server provisioning.
- [x]  Remote backups on Google Cloud buckets.
- [x]  Remote backups on AWS S3 buckets. 
- [ ]  Cloudways input parameters verification
 
### Layout

```tree
├── aws
│   ├── .auth
│   │   └── aws_credentials
│   └── modules
│       ├── createBackupScript
│       ├── createBucket
│       ├── createServer
│       └── createServiceAccount
│   ├── main.tf
│   ├── new_server_id.txt
│   ├── outputs.tf
│   ├── providers.tf
│   ├── remoteStateBucketAccess.json
│   └── variables.tf
├── gcp
│   ├── .auth
│   │   └── credentials.json
│   └── modules
│       ├── createBackupScript
│       ├── createBucket
│       ├── createServer
│       └── createServiceAccount
│   ├── main.tf
│   ├── new_server_id.txt
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
├── scripts
|   ├── aws_backup_script.sh
│   └── gcp_backup_script.sh
├── .gitignore
├── LICENSE
└── README.md

```

A brief description of the layout:

* `.auth` Folder containing Google Cloud and AWS authentication credentials.
* `createBackupScript` Module to create AWS and GCP backup scripts from templates available in `scripts`.
* `createBucket` Module to create AWS/GCP buckets to store Cloudways application backups. 
* `createServer` Module to launch a Cloudways server.
* `createServiceAccount` Module for creating remote provider service accounts to be used by Cloudways server backup cron.
* `main.tf` Main Terraform configuration file
* `new_server_id.txt` Text file containing the ID of the new Cloudways server.
* `outputs.tf` Terraform outputs configuration file.
* `providers.tf` Terraform providers configuration file.
* `variables.tf`  Terraform variables configuration file.
* `scripts` folder containing backup script templates.
* `aws_backup_script.sh` Shell script for AWS backup operations.
* `gcp_backup_script.sh` Shell script for GCP backup operations.
* `.gitignore` for excluding specific files and directories.
* `LICENSE` File containing the license information for the repository.
* `README.md` Project readme file.

### Built with

<a href="https://www.terraform.io/"><img src="https://www.svgrepo.com/show/376353/terraform.svg" alt="Terraform Logo" width="40" height="40"></a> <a href="https://www.gnu.org/software/bash/"><img src="https://seeklogo.com/images/B/bash-logo-BF4F6893D9-seeklogo.com.png" alt="Bash" width="40" height="40"></a> <a href="https://cloud.google.com/storage/"><img src="https://www.geekandjob.com/uploads/wiki/a73a9257693d0f4bee6f7a62a5f352eea0937c41.png" alt="Google Cloud Storage" width="40" height="40"></a> <a href="https://aws.amazon.com/pm/serv-s3/"><img src="https://cdn.iconscout.com/icon/free/png-256/free-amazon-aws-3628617-3029842.png" alt="AWS S3 Storage" width="40" height="40"></a>

###  Skills
- Infrastructure as Code
- Bash scripting

### Badges

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)



### Feedback

If you have any feedback, please reach out to me at elisha.jamil@gmail.com