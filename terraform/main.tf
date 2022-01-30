terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-id_of_linux_distribution"
  instance_type = "t2.micro"
  key_name               = "keyname"
  monitoring             = true
  vpc_security_group_ids = ["sg-security_group"]
  subnet_id              = "subnet-id"

  tags = {
    Name = "demoInstance"
  }
}
