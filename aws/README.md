<div align="center">
<a href="https://aws.amazon.com/"><img src="https://neelbhatt40.files.wordpress.com/2017/05/s3.png" alt="Image from neelbhatt.com"></a>
</div>

<h1 align="center"> Application backups on AWS</h1>


This directory comprises HCL configuration files designed to create and manage Cloudways application backups stored in an S3 bucket. It streamlines the process of launching a new Cloudways server and configuring it to automatically upload application backups to AWS.
## Usage

### Pre-requisites
#### 1. Remote Terraform State configuration
* Create a bucket on AWS/GCP to store terraform state.
* Set up a DynamoDB table for state locking (required for AWS state storage only).

#### 2. Service account configuration
* Create an [IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) with the following priveleges 
    * Access to the state bucket.
    * Authorization to create a new bucket for application storage.
    * Access to the state bucket.
    * Authorization to create a new bucket for application storage.
* Create and download [access keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey) to be used by Terraform.
* Use the generated access keys and configure `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` as environment variables or by using the command: 

```bash
aws configure
```
#### 3. Cloudways credentials
You will be prompted to provide the following credentials on Terraform code execution.
* `CLOUDWAYS_EMAIL` Cloudways primary account email
* `CLOUDWAYS_API_KEY` API Key generated on [Cloudways Platform API](https://support.cloudways.com/en/articles/5136065-how-to-use-the-cloudways-api) Section

#### 4. Cloudways server configuration
Adjust the new server configurations (size/region/provider) in `modules/createServer/variables.tf`
#### Deployment

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