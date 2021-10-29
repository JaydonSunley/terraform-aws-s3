# AWS S3 Bucket Terraform module

Terraform module which creates an S3 bucket with logging and a policy for secure connections only
The logging bucket must already exist.

## Usage

```hcl
module "s3" {
  source                = "JoelsHub/s3/aws"
  version               = "2.2.0"
  bucket_key            = "Test Bucket"
  logging_bucket        = "Test Logging Bucket"
  create_logging_bucket = false
  public_access         = false
}
```