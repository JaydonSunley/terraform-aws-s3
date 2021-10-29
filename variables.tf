variable "logging_bucket"{
  type        = string
  description = "(Required) name of the logging bucket"
}

variable "bucket_key"{
  type        = string
  description = "(Required) name of the s3 bucket"
}

variable "create_logging_bucket" {
  description = "If true, logging_bucket will be the name of the new logging bucket created"
  type        = bool
}

variable "public_access" {
  description = "If true, public access will not be blocked during s3 creation"
  type        = bool
}