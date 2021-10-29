resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3.id
  policy = jsonencode(
    {
          Id        = "BUCKET-POLICY"
          Statement = [
              {
                  Action    = "s3:*"
                  Condition = {
                      Bool = {
                          "aws:SecureTransport" = "false"
                        }
                    }
                  Effect    = "Deny"
                  Principal = "*"
                  Resource  = [
                      "arn:aws:s3:::${aws_s3_bucket.s3.id}/*",
                      "arn:aws:s3:::${aws_s3_bucket.s3.id}",
                    ]
                  Sid       = "AllowSSLRequestsOnly"
                },
            ]
          Version   = "2012-10-17"
        }
    )
}