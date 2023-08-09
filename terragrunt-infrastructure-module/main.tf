provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"] #deploys any recent AWS AMI from Canonical
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vmsize
  tags = {
    Name          = "${var.prefix}-terragrunt-test-${var.environment}"
    ttl           = 1
    owner         = "yulei@hashicorp.com"
    region        = "APJ-ANZ"
    purpose       = "demo"
    terraform     = "true"
    tfe           = "true"
    instance_type = var.vmsize
  }
}
