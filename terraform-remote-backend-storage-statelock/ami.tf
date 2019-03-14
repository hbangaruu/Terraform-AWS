# Terraform data resource to get the latest amazon ami and this is been interpolated in main.tf file while creating the instance.

data "aws_ami" "ec2-linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "owner-alias"
    values = ["amazon"]
  }
}
