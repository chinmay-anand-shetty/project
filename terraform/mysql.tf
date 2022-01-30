terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_db_instance" "demo_user" {
  allocated_storage       = 08             
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  identifier              = "identifying_name"
  name                    = "user"
  username                = "user_name"
  password                = "*******"
  multi_az                = "false"
  storage_type            = "gp2"
  backup_retention_period = 30
  skip_final_snapshot     = true
  publicly_accessible     = true
  tags = {
    Name = "name_instance"
  }
}
