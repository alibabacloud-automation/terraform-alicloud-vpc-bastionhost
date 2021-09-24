resource "alicloud_bastionhost_instance" "default" {
  description        = var.name
  license_code       = var.bastion_license_code
  period             = var.period
  vswitch_id         = var.vswtich_id
  security_group_ids = var.security_group_ids
}

resource "alicloud_bastionhost_host" "default" {
  instance_id          = alicloud_bastionhost_instance.default.id
  host_name            = var.name
  active_address_type  = var.active_address_type
  host_private_address = var.host_private_address
  os_type              = var.os_type
  source               = var.host_source
}
