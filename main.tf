terraform {
  required_version = ">= 0.11.8"
}

provider "aws" {
  alias  = "${var.source_region}"
  region = "${var.source_region}"
}

data "aws_ami" "source" {
  provider = "aws.${var.source_region}"
  count    = "${length(var.release_versions)}"

  most_recent = true
  owners      = ["${var.ami_owner}"]
  name_regex  = "${lower(var.product_name)}-image_${lower(element(keys(var.release_versions[count.index]), 0))}${var.nomad_versions[count.index] != "nil" ? format("%s%s", "_nomad_", lower(var.nomad_versions[count.index])) : ""}${var.vault_versions[count.index] != "nil" ? format("%s%s", "_vault_", lower(var.vault_versions[count.index])) : ""}${var.consul_versions[count.index] != "nil" ? format("%s%s", "_consul_", lower(var.consul_versions[count.index])) : ""}_${lower(var.os)}_${var.os_version}.*"

  filter {
    name   = "tag:System"
    values = ["${title(var.product_name)}"]
  }

  filter {
    name   = "tag:Product"
    values = ["${title(var.product_name)}"]
  }

  filter {
    name   = "tag:Release-Version"
    values = ["${lower(element(keys(var.release_versions[count.index]), 0))}"]
  }

  filter {
    name   = "tag:Consul-Version"
    values = ["${lower(var.consul_versions[count.index])}"]
  }

  filter {
    name   = "tag:Vault-Version"
    values = ["${lower(var.vault_versions[count.index])}"]
  }

  filter {
    name   = "tag:Nomad-Version"
    values = ["${lower(var.nomad_versions[count.index])}"]
  }

  filter {
    name   = "tag:OS"
    values = ["${lower(var.os)}"]
  }

  filter {
    name   = "tag:OS-Version"
    values = ["${var.os_version}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

/*resource "aws_ami_launch_permission" "source" {
  provider = "aws.${var.source_region}"
  count    = "${length(var.enabled_accounts) * length(data.aws_ami.source.*.id)}"

  image_id   = "${element(data.aws_ami.source.*.id, count.index % length(data.aws_ami.source.*.id))}"
  account_id = "${var.enabled_accounts[floor(count.index / length(data.aws_ami.source.*.id))]}"
}*/
