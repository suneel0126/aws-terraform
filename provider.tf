terraform {
// This block used for matain state file on remote...........
/*
  backend "s3" {
  bucket = "qc-data-rw"
  key = "trfm/terrafform.state.tf"
  region = "ap-south-1"
}
*/
}
provider "aws" {
  region = "us-east-1"
  #access_key = ""
  #secret_key = ""
  #region = "us-west-2"
}



// Create ec2-instance
resource "aws_instance" "ec2" {
  //count         = 1
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key-name
  subnet_id              = aws_subnet.subnet-public.id
  vpc_security_group_ids = [aws_security_group.sg-01.id]
  tags = {
    "name" = "public"
  }
}


// Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "name" = "public"
  }
}

// Create subnet
resource "aws_subnet" "subnet-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
}

resource "aws_security_group" "sg-01" {
  vpc_id = aws_vpc.main.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "value"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    self        = false
    to_port     = 0

  }
  tags = {
    "name" = "terraform"
  }

}
