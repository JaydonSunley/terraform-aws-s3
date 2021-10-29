variable "logging_bucket"{
  type        = string
  description = "(Required) name of the logging bucket"
}

variable "bucket_key"{
  type        = string
  description = "(Required) name of the s3 bucket"
}

variable "create_logging_bucket" {
  description = "If true, neo gets full access to CloudWatch"
  type        = bool
}

variable "public_access" {
  description = "If true, neo gets full access to CloudWatch"
  type        = bool
}