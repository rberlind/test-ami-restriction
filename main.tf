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

# Add fake resource to make sure that TFE runs this each time
resource "null_resource" "fake" {
   triggers {
      uuid = "${uuid()}"
   }
}

resource "aws_instance" "web" {
  provider = "aws.${var.source_region}"
  ami           = "${data.aws_ami.source.id}"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}
