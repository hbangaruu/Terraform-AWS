resource "aws_s3_bucket" "test-bucket1" {
  bucket = "remote-state-bucket1"
  acl    = "private"
  tags = {
    Name = "My remote state bucket"
  }
}
