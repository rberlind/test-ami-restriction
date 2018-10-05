variable "source_region" {
  description = "Source region to copy AMI from."
  default     = "us-west-1"
}

variable "ami_owner" {
  description = "Owner of AMI."
  default     = "self"
}

variable "name" {
  description = "Name of AMI"
  default = "ubuntu-14-04"
}
