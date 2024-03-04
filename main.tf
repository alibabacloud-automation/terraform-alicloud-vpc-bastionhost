resource "alicloud_bastionhost_instance" "default" {
  vswitch_id         = var.vswitch_id != "" ? var.vswitch_id : var.vswtich_id
  security_group_ids = var.security_group_ids
  description        = var.description != "" ? var.description : var.name
  license_code       = var.bastion_license_code
  period             = var.period
  bandwidth          = var.bandwidth
  storage            = var.storage
  plan_code          = var.plan_code
}

resource "alicloud_bastionhost_host" "default" {
  instance_id          = alicloud_bastionhost_instance.default.id
  host_name            = var.name
  active_address_type  = var.active_address_type
  host_private_address = var.host_private_address
  os_type              = var.os_type
  source               = var.host_source
}