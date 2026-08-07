
variable "env_name" {
  description = "Name of the environment"
  default     = "prod"
  type        = string
}

variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
  type        = string
}

variable "ec2-ami" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-006f82a1d5a27da54"
  type        = string
}

variable "default_block_storage" {
  description = "Block storage size for the EC2 instance"
  type = number
  default = 10
}



