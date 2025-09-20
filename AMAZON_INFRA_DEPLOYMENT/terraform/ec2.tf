terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # latest compatible version
    }
  }
  required_version = ">= 1.5"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y apache2 git
    git clone https://github.com/Ironhack-Archive/online-clone-amazon.git
    mv online-clone-amazon/* /var/www/html/
  EOF

  tags = {
    Name = "AmazonApp"
  }
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}
