#in order to create we need vpc,key pairs , security groups so will be creating those first and remaining after that

#key pair 

resource "aws_key_pair" "my_key"{
  key_name   = "terra-key-ec2"
  public_key = file("terra-key.pub")
}

#default vpc

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

#security group 

resource "aws_security_group" "my_security_group" {
  name        = "automatic-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_default_vpc.default.id

#ingress for incoming traffic

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH traffic from anywhere"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from anywhere"
  } 

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow traffic from anywhere for flask app on port 8000"
  }

  #egress for outgoing traffic

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automatic-security-group"
  }
}


#now we will create ec2 instance and will use the above created resources in it

resource "aws_instance" "my_ec2_instance" {
  ami           = var.ec2-ami
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]

  #storage which we sede at bottom while crrating instance
  
  root_block_device {
    volume_size = var.ec2_block_storage
    volume_type = "gp3"
  }

  tags = {
    Name = "MyEC2Instance using terraform"
  }
}
