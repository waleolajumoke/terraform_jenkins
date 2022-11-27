terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
}


resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow Jenkins Traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    # description      = "Allow SSH and jenkins from Personal CIDR block"
    iterator = port
    for_each = var.ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins SG"
  }
}


resource "aws_instance" "web"{
  ami = var.ami
  instance_type = "t2.xlarge"
  key_name = var.key_name 
  security_groups      = [aws_security_group.jenkins_sg.name]
  user_data = file("install_jenkins.sh")

  tags = {
    Name = "Jenkins"
  }
}
