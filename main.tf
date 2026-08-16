terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "us-east-2"
}

# Find the latest Ubuntu 24.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Security group for the WordPress server
resource "aws_security_group" "wordpress" {
  name        = "wordpress-security-group"
  description = "Allow SSH and HTTP traffic for WordPress"

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-security-group"
  }
}

# WordPress EC2 server
resource "aws_instance" "wordpress_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  key_name = "jenkins-key"

  vpc_security_group_ids = [
    aws_security_group.wordpress.id
  ]

  tags = {
    Name = "wordpress-server"
  }
}

# Display useful information after Terraform creates the server
output "wordpress_public_ip" {
  description = "Public IP address of the WordPress server"
  value       = aws_instance.wordpress_server.public_ip
}

output "wordpress_public_dns" {
  description = "Public DNS name of the WordPress server"
  value       = aws_instance.wordpress_server.public_dns
}