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
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  key_name               = "s101"
  monitoring             = true
  vpc_security_group_ids = ["sg-0f32cba2b39496607"]
  subnet_id              = "subnet-04cb06f917d223c8e"

  tags = {
    Name = "demoInstance"
  }
}
