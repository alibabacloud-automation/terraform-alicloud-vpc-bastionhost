module "example" {
  source               = "../"
  vpc_name             = "terraformTestVpcName"
  vpc_cidr_block       = "terraformTestVpcCidrBlock"
  bastion_license_code = "bhah_ent_50_asset"
}
