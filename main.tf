provider "aws" {
region = var.aws_region
access_key = "AKIAR3EPJ2LQ76PDUXHB"
secret_key = "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"
}

resource "aws_instance" "Test_Server" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name= var.key_name
   user_data = file("docker.sh")
  tags= {
    Name = var.tag_name
 }
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


