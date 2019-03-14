# configuring s3 as the backend storage for storing state file.
terraform {
  backend "s3" {
    bucket         = "terraform-state-940" # change it to the name of the name of your bucket
    key            = "dev"
    region         = "us-east-1"
    dynamodb_table = "terraform-statelock"
  }
}
