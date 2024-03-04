variable "vswtich_id" {
  description = "(Deprecated from version 1.1.0) Vswtich id."
  type        = string
  default     = ""
}

#alicloud_bastionhost_instance
variable "vswitch_id" {
  description = "VSwitch ID configured to Bastionhost."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "security group IDs configured to Bastionhost. NOTE: There is a potential diff error because of the order of security_group_ids values indefinite. So, from version 1.160.0, security_group_ids type has been updated as set from list, and you can use tolist to convert it to a list."
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  type        = string
  default     = ""
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

variable "bandwidth" {
  description = "The bandwidth of Cloud Bastionhost instance. If China-Site Account, its valid values: 0 to 150. Unit: Mbit/s. The value must be a multiple of 5. If International-Site Account, its valid values: 0 to 200. Unit: Mbit/s. The value must be a multiple of 10."
  type        = string
  default     = ""
}

variable "storage" {
  description = "The storage of Cloud Bastionhost instance. Valid values: 0 to 500. Unit: TB."
  type        = string
  default     = ""
}

variable "plan_code" {
  description = "The plan code of Cloud Bastionhost instance. Valid values: cloudbastion: Basic Edition; cloudbastion_ha: HA Edition."
  type        = string
  default     = ""
}

#alicloud_bastionhost_host
variable "name" {
  description = "Specify the new create a host name of the supports up to 128 characters."
  type        = string
  default     = ""
}

variable "active_address_type" {
  description = "The active address type of instance."
  type        = string
  default     = "Private"
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

variable "host_source" {
  description = "The host source of instance."
  type        = string
  default     = "Local"
}