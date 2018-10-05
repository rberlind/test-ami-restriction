variable "source_region" {
  description = "Source region to copy AMI from."
  default     = "us-west-1"
}

variable "ami_owner" {
  description = "Owner of AMI."
  default     = "self"
}

variable "product_name" {
  description = "Product name (e.g. Consul, Vault, Nomad, HashiStack)."
}

variable "release_versions" {
  type        = "list"
  description = "List of maps containing release version keys (e.g. 0.1.0, 0.1.0-rc1, 0.1.0-beta1, 0.1.0-dev1) and values for if the image should be public (only OSS images); view available releases at https://github.com/hashicorp/guides-configuration#hashistack-version-tables; create new releases at https://github.com/hashicorp/guides-configuration/blob/master/versions.sh#L36-L39"
}

variable "consul_versions" {
  type        = "list"
  description = "Consul version (e.g. x.y.z), defaults to nil."
}

variable "vault_versions" {
  type        = "list"
  description = "Vault version (e.g. x.y.z), defaults to nil."
}

variable "nomad_versions" {
  type        = "list"
  description = "Nomad version (e.g. x.y.z), defaults to nil."
}

variable "os" {
  description = "Operating System (e.g. RHEL or Ubuntu)."
}

variable "os_version" {
  description = "Operating System version (e.g. 7.3 for RHEL or 16.04 for Ubuntu)."
}

variable "enabled_accounts" {
  type        = "list"
  description = "The list of accounts to grant access to AMIs."

  default = []
}
