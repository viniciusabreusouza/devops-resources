# Configure the AWS Provider
provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

resource "aws_instance" "telemetria" {
    count = 3
    ami = "ami-0758470213bdd23b1"
    instance_type = "t2.micro"
    key_name = "bootcampInfra"
    tags = {
        Name = "telemetria${count.index}"
    }
    vpc_security_group_ids = ["sg-07e592093f51cd6be","sg-0b7ecaf3bd833796d"]
}

resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Liberando acessos aos servidores via SSH"

  ingress {

    from_port   = 22
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso SSH"
  }
}

resource "aws_security_group" "acesso_http" {
  name        = "acesso_http"
  description = "Liberando acessos aos servidores via SSH"

  ingress {

    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso Http"
  }
}
