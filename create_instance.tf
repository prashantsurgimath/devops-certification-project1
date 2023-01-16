provider "aws" {
region = "ap-south-1"
access_key = "AKIAR3EPJ2LQYBJEX535"
secret_key = "n7UexV6HYnFkI7zjKKwQzSIQQvydVbHu4icQGELJ"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0ef82eeba2c7a0eeb"
    instance_type = "t2.micro"
    key_name= "Terraform"
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}
