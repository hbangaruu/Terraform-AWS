###################################################################
# Output for Instance Role
###################################################################

output "instance_profile_name" {
  value = "${aws_iam_instance_profile.ec2-profile.name}"
}

output "instance_profile_arn" {
  value = "${aws_iam_instance_profile.ec2-profile.arn}"
}

output "public-ip" {
  value = "${aws_instance.test_instance.public_ip}"
}
