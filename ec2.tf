# AWS Provider Configuration
provider "aws" {
  region = "ap-south-1"
}

# Fetch Default VPC
resource "aws_default_vpc" "default" {
}

# EC2 Instances
resource "aws_instance" "my_instance" {
  count         = 3
  ami           = "ami-01a00762f46d584a1" # Your Ubuntu AMI ID
  instance_type = "t3.micro"

  # Existing AWS SSH Key Pair Name
  key_name = "nextgen"

  # Existing Security Group ID
  vpc_security_group_ids = ["sg-02bfe379dacbe038c"]

  # Bootstrapping script execution (Links deployment.sh)
  user_data = file("deployment.sh")

  # Root EBS Volume (10 GiB, gp3)
  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = {
    Name = "terra-automate-server-${count.index + 1}"
  }
}
