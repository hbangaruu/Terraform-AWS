#Output S3 bucket name to use it during instance creation to store the respective state in this s3 bucket
output bucket_arn {
  value = "${aws_s3_bucket.b.arn}"
}
