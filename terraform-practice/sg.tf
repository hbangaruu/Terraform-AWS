###########################################
#Security Group for Vault EC2 Linux Server
###########################################

resource "aws_security_group" "test_sg" {
  name        = "${var.region_tag}-${var.sg_name}"
  description = "Security Group for test ubuntu Server"
  tags {
    "Name" =  "${var.region_tag}-${var.sg_name}"
  }
}
