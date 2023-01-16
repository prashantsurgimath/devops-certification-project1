provider "aws" {
region = var.aws_region
access_key = "AKIAR3EPJ2LQ3O2CF27G"
secret_key = "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"
}

resource "aws_instance" "Test_Server" {
    ami = "ami-0ef82eeba2c7a0eeb"
    instance_type = "t2.micro"
    key_name= "Terraform"
   user_data = file("docker.sh")
  tags= {
    Name = "Test_Server"
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


