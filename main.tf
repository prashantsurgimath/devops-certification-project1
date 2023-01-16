provider "aws" {
region = "ap-south-1"
access_key = "AKIAR3EPJ2LQ3O2CF27G"
secret_key = "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"
}

resource "aws_instance" "test" {
    ami = "ami-0ef82eeba2c7a0eeb"
    instance_type = "t2.micro"
    key_name= "Terraform"
  tags= {
    Name = "TestServer"
 }
}




