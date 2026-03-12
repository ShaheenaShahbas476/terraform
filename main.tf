module "resource_group" {
  source   = "./modules/resource-group"
  prefix   = local.prefix
  location = var.location
  tags     = local.tags
}

module "networking" {

  source = "./modules/networking"

  prefix         = local.prefix
  location       = var.location
  resource_group = module.resource_group.name

  vnet_cidr     = var.vnet_cidr
  dev_subnet    = var.dev_subnet
  prod_subnet   = var.prod_subnet
  github_subnet = var.github_subnet

  tags = local.tags
}

module "security" {

  source = "./modules/security"

  prefix         = local.prefix
  location       = var.location
  resource_group = module.resource_group.name

  tags = local.tags

}

module "compute" {

  source = "./modules/compute"

  prefix         = local.prefix
  location       = var.location
  resource_group = module.resource_group.name
  dev_subnet_id  = module.networking.dev_subnet_id
  vm_size        = var.vm_size
  ssh_public_key = "~/.ssh/id_rsa.pub"

}
module "dns" {
  source         = "./modules/dns"
  resource_group = module.resource_group.name
}

module "private_endpoint" {

  source = "./modules/private-endpoint"

  location       = var.location
  resource_group = module.resource_group.name

  subnet_id  = module.networking.prod_subnet_id
  storage_id = module.storage.storage_account_id
  acr_id     = module.acr.acr_id

}
module "vmss" {

  source = "./modules/vmss"

  prefix         = local.prefix
  location       = var.location
  resource_group = module.resource_group.name

  subnet_id = module.networking.prod_subnet_id

  ssh_public_key = "~/.ssh/id_rsa.pub"

  startup_script = "${path.module}/scripts/startup.sh"

  tags = local.tags

}

module "gateway" {

  source = "./modules/gateway"

  prefix         = local.prefix
  location       = var.location
  resource_group = module.resource_group.name

  appgw_subnet_id = module.networking.appgw_subnet_id
  public_ip_id    = module.networking.appgw_public_ip_id

}

module "storage" {

  source = "./modules/storage"

  resource_group = module.resource_group.name
  location       = var.location

  tags = local.tags
}

module "acr" {

  source = "./modules/acr"

  resource_group = module.resource_group.name
  location       = var.location

  tags = local.tags
}

module "mysql" {

  source = "./modules/mysql"

  resource_group = module.resource_group.name
  location       = var.location

  admin_password = "StrongPassword123!"

  tags = local.tags
}
