variable "name" {
  description = "Default name."
  type        = string
  default     = "TerraformTest"
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
  default     = "tf-testAccVpcName"
}

variable "vpc_cidr_block" {
  description = "The secondary CIDR blocks for the VPC."
  type        = string
  default     = "172.16.0.0/12"
}

variable "bastion_license_code" {
  description = "The secondary CIDR blocks for the VPC."
  type        = string
  default     = "bhah_ent_50_asset"
}

variable "active_address_type" {
  description = "The active address type of instance."
  default     = "Private"
}

variable "host_private_address" {
  description = "The host private address of instance."
  default     = "172.16.0.10"
}

variable "os_type" {
  description = "The os type of instance."
  default     = "Linux"
}

variable "host_source" {
  description = "The host source of instance."
  default     = "Local"
}

variable "period" {
  description = "The period of instance."
  default     = "1"
}
