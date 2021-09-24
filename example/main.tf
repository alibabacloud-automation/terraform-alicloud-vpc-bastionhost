provider "alicloud" {
  region = "cn-huhehaote"
  profile = "default"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "TerraformTest"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.default.id
  name   = "TerraformTest"
}

resource "alicloud_vswitch" "default" {
  vpc_id     = alicloud_vpc.default.id
  cidr_block = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 4)
  zone_id    = data.alicloud_zones.default.zones[0].id
}

locals {
  zone_id = data.alicloud_zones.default.ids[length(data.alicloud_zones.default.ids) - 1]
}

module "example" {
  source               = "../"
  vswtich_id           = alicloud_vswitch.default.id
  security_group_ids   = [alicloud_security_group.default.id]
  bastion_license_code = "bhah_ent_50_asset"
}
