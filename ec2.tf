#in order to create we need vpc,key pairs , security groups so will be creating those first and remaining after that

#key pair 

resource "aws_key_pair" "my_key"{
  key_name   = "terra-key-ec2"
  public_key = file("terra-key.pub")
}

