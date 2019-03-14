variable "aws_region" {
    description = "EC2 Region"
    default = "us-east-1"
}
# Create a aws profile and give that name here, I have created a profile named 'test'
variable "aws_cred_profile" {
    description = "AWS Profile name"
    default = "test"
}

