resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_key
  acl = "private"
  tags = {
    Name        = var.bucket_key
    Environment = local.workspace["aws_profile"]
  }

  logging {
    target_bucket = data.aws_s3_bucket.logging.id
    target_prefix = var.bucket_key
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}


resource "aws_s3_bucket_public_access_block" "s3_Access" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}