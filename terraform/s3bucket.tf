resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "dpvo-workshop-tf-remote-state-fede"
  acl    = "private"

  versioning {
     enabled = true
   }

  server_side_encryption_configuration {
    rule {
       apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
                }
         }
  }
}