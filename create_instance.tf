resource "aws_instance" "ap-south-1" {
    ami = "ami-0ef82eeba2c7a0eeb"
    instance_type = "t2.micro"
    key_name= "Terraform"
    security_groups = ["sgr-0153612aaa5d3ff65"]
  tags= {
    Name = "TestServer"
 }
}
