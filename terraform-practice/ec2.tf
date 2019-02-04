/*
data "aws_ami" "latest-ubuntu" {
  most_recent = true
  executable_users = ["self"]
   
  filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
      name = "virtualization-type"
      values = ["hvm"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

}
*/
resource "aws_key_pair" "test-key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyn9FUgBglav/kKQosILzTTVYf86Uc+/XUfl0uwaZHwpbtFAb2PqBY0vZZHO0MQAifTth5+woGbkfhYNmsjAWE4Hs8T14DptFy+q9dGrZlgZVK1e3J0eu/4n85X9e4lc0vvFvvGIyOsOx++J99vElXkWPnWBYaSyy0xFjUyUVcYYEaYMr9vGhw7+OY4HZIV6hyafIrHAeFloOUdKHGd7PZ1iW1Mdgw3FKESOnWhL1uM8UFEKsaZ9yU3U6Ls6xkzmx38RSPeUJlJtPoK9nx3mKDWHCWCDNyrsqF+h3zhJaMzYc1k4gzEG4kYcxwYE3flxtygVx2euB9EwJ27B/ozz7wzJW4YMjntKdO88l9MiOhPjKU68Epe5MW7xo+ZmXNE88l6h9uygipOX4XAK5NHDCWOyym6HDJsJZVs3pLEh9suqenYS5MCR7RO4QG/0IKe57ydhRHIcF6a/t47Hh3VY14xNtkCjFqIrvtQKMTFTMajSyFa73UgpyeDt2aiH6IedYRGXHDo8jpFune1WsczTJeZBgZND2GC5gF+M9UwdADX7zEG4nsg36Wi3Z9PyRmc7S1OdDRDSLdVGtZaXu/aHaidZJXmAvIKXoMI75riAeusv+0PENMOLlhptVcNNVXEDGu0ndlNugTT468hMakQj06lVq4IraaXykPNvgFWryB+w== hkbangaru@gmail.com"
}

resource "aws_instance" "test_instance" {
  #ami = "${data.aws_ami.latest-ubuntu.id}"
  ami = "ami-70dad51a"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2-profile.name}"
  key_name = "${aws_key_pair.test-key.key_name}"
  tags {
    Name = "First-Instance"
  }
}
