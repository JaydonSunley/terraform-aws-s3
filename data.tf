data "aws_s3_bucket" "logging"{
  bucket = var.logging_bucket
}