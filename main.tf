terraform {
  required_version = ">= 0.11.8"
}

provider "aws" {
  alias  = "${var.source_region}"
  region = "${var.source_region}"
}

data "aws_ami" "source" {
  provider = "aws.${var.source_region}"

  most_recent = true
  owners      = ["${var.ami_owner}"]
}

resource "aws_instance" "web" {
  provider = "aws.${var.source_region}"
  ami           = "${data.aws_ami.source.id}"
  instance_type = "t2.small"

  tags {
    Name = "HelloWorld"
    TTL = "24"
    owner = "roger@hashicorp.com"
  }
}
