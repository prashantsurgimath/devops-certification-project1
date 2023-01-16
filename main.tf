provider "aws" {
region = "ap-south-1"
access_key = "AKIAR3EPJ2LQ4CRVM7NM"
secret_key = "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"
}

resource "aws_instance" "test" {
    ami = "ami-0ef82eeba2c7a0eeb"
    instance_type = "t2.micro"
    key_name= "Terraform"
    security_groups = ["sgr-0153612aaa5d3ff65"]
  tags= {
    Name = "TestServer"
 }
}




