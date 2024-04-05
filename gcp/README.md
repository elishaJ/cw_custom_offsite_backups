<div align="center">
<a href="https://cloud.google.com/"><img src="https://www.techbeatly.com/wp-content/uploads/2020/01/how-to-create-scheduled-snapshots-in-google-cloud-platform.png" alt="Masterhead"></a>
</div>

<h1 align="center"> Application backups on GCP</h1>


This folder contains HCL configuration files designed to create and manage Cloudways application backups stored in a Google Cloud storage bucket. It automates the process of initiating a new Cloudways server and configuring it to seamlessly upload application backups to GCP.
## Usage

### Pre-requisites
#### 1. Remote Terraform State configuration
* Create a bucket on AWS/GCP to store terraform state.
* Set up a DynamoDB table for state locking (required for AWS state storage only).

#### 2. Service account configuration
* Create a [service account](https://cloud.google.com/iam/docs/service-accounts-create) on GCP with the following priveleges 
    * Access to the state bucket.
    * Authorization to create a new bucket for application storage.
* Create and download a [service account key](https://cloud.google.com/iam/docs/keys-create-delete#creating) to be used by Terraform.
* Provide the path of the key in `gcp/variables.tf`

```terraform
variable "GOOGLE_CREDENTIALS" {
  type = string
  #default = <provide file path>
  description = "GCP service account key for terraform authentication"
}
```
#### 3. Cloudways credentials
You will be prompted to provide the following credentials on code execution.
* `CLOUDWAYS_EMAIL` Cloudways primary account email
* `CLOUDWAYS_API_KEY` API Key generated on [Cloudways Platform API](https://support.cloudways.com/en/articles/5136065-how-to-use-the-cloudways-api) Section

#### 4. Cloudways server configuration
Modify the new server configuration (size/region/provider) in `modules/createServer/variables.tf`

### Deployment

* Initialize the working directory by running the following in `aws` directory:

```bash
  terraform init
```
* To view the deployment plan, run the command:
```bash
  terraform plan
```
* To deploy the resouces, run the command:
```bash
  terraform apply
```