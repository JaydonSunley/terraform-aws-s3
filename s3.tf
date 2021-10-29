resource "aws_s3_bucket" "s3_nolog" {
    count = var.create_logging_bucket ? 0 : 1
    bucket = var.bucket_key
    acl = "private"
    
    tags = {
    Name        = var.bucket_key
  }

  logging {
    target_bucket = var.logging_bucket
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

resource "aws_s3_bucket" "logging_bucket" {
    count = var.create_logging_bucket ? 1 : 0
    bucket = var.logging_bucket
    acl = "private"
    
    tags = {
    Name        = var.bucket_key
  }

  logging {
    target_bucket = var.logging_bucket
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

resource "aws_s3_bucket" "s3_log" {
    count = var.create_logging_bucket ? 1 : 0
    bucket = var.bucket_key
    acl = "private"
    
    tags = {
    Name        = var.bucket_key
  }

  logging {
    target_bucket = aws_s3_bucket.logging_bucket[0].id
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


resource "aws_s3_bucket_public_access_block" "s3_Access_log" {
    count = var.public_access ? 0 : 1
    bucket = aws_s3_bucket.s3_log[0].id
    
    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "s3_Access_nolog" {
    count = var.public_access ? 0 : 1
    bucket = var.bucket_key
    
    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}