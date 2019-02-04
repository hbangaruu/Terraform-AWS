/*
  Database Servers
*/
resource "aws_security_group" "db" {
    name = "vpc_db"
    description = "Allow incoming database connections."

    ingress { # SQL Server
        from_port = 1433
        to_port = 1433
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }
    ingress { # MySQL
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "DBServerSG"
    }
}

/*
data "aws_ami" "latest-ubuntu1" {
  owners = ["${var.account_id}"]
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
resource "aws_instance" "dbserver" {
   # ami = "${data.aws_ami.latest-ubuntu1.id}"
    ami = "ami-70dad51a" 
    availability_zone = "us-east-1a"
    instance_type = "m1.small"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.db.id}"]
    subnet_id = "${aws_subnet.us-east-1a-private.id}"
    source_dest_check = false

    tags {
        Name = "DBServer"
    }
}
