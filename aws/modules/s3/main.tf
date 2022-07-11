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
