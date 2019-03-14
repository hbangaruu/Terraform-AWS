# create an S3 bucket to store the terraform state file.
resource "aws_s3_bucket" "b" {
  bucket = "terraform-state-${random_integer.suffix.result}"
  acl    = "private"
}

#S3 bucket should be with a new name and it cannot be named with already used or existing, so a random interger we are using a random suffix at end.
resource "random_integer" "suffix" {
  min = 100
  max = 999
}
