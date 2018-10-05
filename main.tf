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

  filter {
    name   = "name"
    values = ["${title(var.name)}"]
  }

}
