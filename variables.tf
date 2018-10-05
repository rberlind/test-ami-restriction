variable "source_region" {
  description = "Source region to copy AMI from."
  default     = "us-west-1"
}

variable "ami_owner" {
  description = "Owner of AMI."
  default     = "self"
}
