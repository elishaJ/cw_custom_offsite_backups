<div align="center">
<a href="https://aws.amazon.com/"><img src="https://neelbhatt40.files.wordpress.com/2017/05/s3.png" alt="Image from neelbhatt.com"></a>
</div>

<h1 align="center"> Application backups on AWS</h1>


This directory comprises HCL configuration files designed to create and manage Cloudways application backups stored in an S3 bucket. It streamlines the process of launching a new Cloudways server and configuring it to automatically upload application backups to AWS.
## Usage

### Pre-requisites
* Create a bucket on AWS/GCP to store terraform state.
* Set up a DynamoDB table for state locking (required for AWS state storage only).
* Create an [IAM user](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) with the following priveleges 
    * Access to the state bucket.
    * Authorization to create a new bucket for application storage.

#### Cloudways credentials
You will be prompted to provide the following credentials on code execution.
* `CLOUDWAYS_EMAIL` Cloudways primary account email
* `CLOUDWAYS_API_KEY` API Key generated on [Cloudways Platform API](https://support.cloudways.com/en/articles/5136065-how-to-use-the-cloudways-api) Section

#### Cloudways server configuration
Modify the new server configuration (size/region/provider) in `modules/createServer/variables.tf`

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