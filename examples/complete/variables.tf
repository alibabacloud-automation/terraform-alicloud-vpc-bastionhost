#alicloud_bastionhost_instance
variable "description" {
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  type        = string
  default     = "tf-testacc-description"
}

variable "bastion_license_code" {
  description = "The package type of Cloud Bastionhost instance. You can query more supported types through the DescribePricingModule."
  type        = string
  default     = "bhah_ent_50_asset"
}

variable "period" {
  description = "Duration for initially producing the instance. Valid values: [1~9], 12, 24, 36."
  type        = number
  default     = 1
}

#alicloud_bastionhost_host
variable "name" {
  description = "Specify the new create a host name of the supports up to 128 characters."
  type        = string
  default     = "tf-testacc-name"
}

variable "host_private_address" {
  description = "The host private address of instance."
  type        = string
  default     = "172.16.0.10"
}

variable "os_type" {
  description = "The os type of instance."
  type        = string
  default     = "Linux"
}