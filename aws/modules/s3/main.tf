resource "aws_s3_bucket" "archmydes" {
  bucket = "archmydes"
}
resource "aws_s3_bucket_ownership_controls" "archmydesacl" {
  bucket = aws_s3_bucket.archmydes.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
resource "aws_s3_bucket_public_access_block" "archmydesaccess" {
  bucket = aws_s3_bucket.archmydes.id

  block_public_acls   = true
  block_public_policy = true
}
resource "aws_kms_key" "archmydeskms" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
resource "aws_s3_bucket_server_side_encryption_configuration" "archmydesencrypt" {
  bucket = aws_s3_bucket.archmydes.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.archmydeskms.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
resource "aws_s3_access_point" "example" {
  bucket = aws_s3_bucket.archmydes.arn
  name   = "s3archmydes"

  # VPC must be specified for S3 on Outposts
  vpc_configuration {
    vpc_id = aws_vpc.default.id
  }
}

resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}
