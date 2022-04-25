Terraform module which creating VPC and bastion host on Alibaba Cloud

terraform-alicloud-vpc-bastionhost
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云创建VPC网络并创建堡垒机。

本 Module 支持创建以下资源：

* [alicloud_bastionhost_host](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_host)
* [alicloud_bastionhost_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_instance)

## 用法

```hcl
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
  source               = "terraform-alicloud-modules/vpc-bastionhost/alicloud"
  vswtich_id           = alicloud_vswitch.default.id
  security_group_ids   = [alicloud_security_group.default.id]
  bastion_license_code = "bhah_ent_50_asset"
}
```

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.110.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.110.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)