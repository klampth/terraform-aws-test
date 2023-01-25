provider "aws" {
    region = "ca-central-1"
}
#export AWS_SECURITY_KEY_ID=#Don't forget to export it
#export AWS_SECRET_KEY_ID=#Don't forget to export it
resource "aws_vpc" "b" {

    cidr_block = "10.11.0.0/16"
  tags = {
    Name        = "terra_test_pmanchev-01"
    Environment = "Dev"
    force_destroy = true
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "terra-test-pmanchev-01"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    force_destroy = true
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
#  acl    = "private"
  acl = "log-delivery-write"
}

