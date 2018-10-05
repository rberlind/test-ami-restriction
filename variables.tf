variable "source_region" {
  description = "Source region to copy AMI from."
  default     = "us-west-1"
}

# 063491364108 has 83 AMIs
# It can be used to test failure of Sentinel policy
variable "ami_owner" {
  description = "Owner of AMI."
  default     = "self"
}
