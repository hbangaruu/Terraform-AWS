#Creating Ec2-instance for practicing remote-state-management and state locking demo

resource "aws_instance" "demo_instance" {
  ami           = "${data.aws_ami.ec2-linux.id}"
  instance_type = "t2.micro"

  tags {
    Name = "state-lock-demo"
  }

  provisioner "local-exec" {
    command = "sleep 90"
  }
}

#There is some filter problem so this is been done in other seperate file ami.tf. So commented the below code. 
# Note for any single reosurce testing you can comment out as below and can run plan and apply to check the status.
/*
data "aws_ami" "amzn-linux" {
  most_recent = true
  executable_users = ["self"]
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-x86_64-gp2"]
  }
}
*/
