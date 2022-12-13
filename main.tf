provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "Test_server" {
  ami           = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  user_data = file("docker.sh")
  tags= {
    Name = var.tag_name
  }
}

