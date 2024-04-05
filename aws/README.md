<div align="center">
<a href="https://aws.amazon.com/"><img src="https://qiita-user-contents.imgix.net/https%3A%2F%2Fqiita-image-store.s3.amazonaws.com%2F0%2F117479%2Fd45582b9-b95d-732b-ec18-77c79a5bb143.jpeg?ixlib=rb-4.0.0&auto=format&gif-q=60&q=75&s=5f69f4159c6eb8928cbc2bdaa40d0307" alt="Masterhead"></a>
</div>

<h1 align="center"> Application backups on s3</h1>


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