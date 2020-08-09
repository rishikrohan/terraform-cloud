provider "aws" {
  region = "us-west-2"
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.large"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = "us-west-2a"
  instance_type     = lookup(var.instance_type, terraform.workspace)
}
