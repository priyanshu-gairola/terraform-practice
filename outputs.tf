/*
# below are the outputs for the created EC2 instances. Since we are creating multiple instances using for_each, we will use the splat operator to get the public IP, DNS, and private IP of all instances.

output "aws_instance_public_ip" {
  value = aws_instance.my_ec2_instance[*].public_ip
}

output "aws_instance_dns" {
  value = aws_instance.my_ec2_instance[*].public_dns
}

output "aws_instance_private_ip" {
  value = aws_instance.my_ec2_instance[*].private_ip
}
*/

#below are outputs which we need to use with the for_each meta-argument to get the public IP, DNS, and private IP of all instances.

output "aws_instance_public_ip" {
  value = [
    for instance in aws_instance.my_ec2_instance : instance.public_ip
  ]
}


output "aws_instance_dns" {
  value = [
    for instance in aws_instance.my_ec2_instance : instance.public_dns
  ]
}

output "aws_instance_private_ip" {
  value = [
    for instance in aws_instance.my_ec2_instance : instance.private_ip
  ]
}