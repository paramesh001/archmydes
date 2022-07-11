resource "aws_s3_bucket" "archmydes" {
  bucket = "archmydes"
}
resource "aws_s3_bucket_ownership_controls" "archmydesacl" {
  bucket = aws_s3_bucket.archmydes.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
