data "alicloud_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "security_group" {
  source = "alibaba/security-group/alicloud"
  vpc_id = length(data.alicloud_vpcs.default.vpcs) > 0 ? data.alicloud_vpcs.default.vpcs.0.id : module.vpc.this_vpc_id
}

module "example" {
  source = "../.."

  #alicloud_bastionhost_instance
  vswitch_id           = length(data.alicloud_vswitches.default.vswitches) > 0 ? data.alicloud_vswitches.default.vswitches.0.id : module.vpc.this_vswitch_ids[0]
  security_group_ids   = [module.security_group.this_security_group_id]
  description          = var.description
  bastion_license_code = var.bastion_license_code
  period               = var.period
  bandwidth            = var.bandwidth
  storage              = var.storage
  plan_code            = var.plan_code

  #alicloud_bastionhost_host
  name                 = var.name
  active_address_type  = "Private"
  host_private_address = var.host_private_address
  os_type              = var.os_type
  host_source          = "Local"

}