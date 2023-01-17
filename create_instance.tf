provider "aws" {
region = "us-east-1"
access_key = "AKIAUPFWGORO56CZCU7L"
secret_key = "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"
}

resource "aws_instance" "ec2" {
    ami = "ami-06878d265978313ca"
    instance_type = "t2.micro"
    key_name= "devops"
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
