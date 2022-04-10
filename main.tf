terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# Create a VPC
resource "aws_vpc" "yuval" {
  cidr_block = "192.168.1.0/24"
  tags = {
    "name" = "yuval"
  }
}

###### subnet_web #####
resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.yuval.id
  cidr_block = "192.168.1.0/27"

  tags = {
    Name = "subnet_web"
  }
}

 
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.yuval.id
  cidr_block = "192.168.1.32/27"

  tags = {
    Name = "subnet_app"
  }
}


resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.yuval.id
  cidr_block = "192.168.1.64/28"

  tags = {
    Name = "subnet_db"
  }
}