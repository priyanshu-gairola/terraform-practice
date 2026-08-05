output "aws_instance_public_ip" {
  value = aws_instance.my_ec2_instance.public_ip
}

output "aws_instance_dns" {
  value = aws_instance.my_ec2_instance.public_dns
}

output "aws_instance_private_ip" {
  value = aws_instance.my_ec2_instance.private_ip
}