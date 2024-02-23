# main.tf

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

module "nsg" {
  source                  = "./modules/nsg"
  nsg_name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  nsg_rules               = var.nsg_rules
}

module "vnet" {
  source                    = "./modules/vnet"
  vnet_name                 = var.vnet_name
  location                  = var.location
  resource_group_name      = var.resource_group_name
  vnet_address_space        = var.vnet_address_space
  subnet_name               = var.subnet_name
  subnet_address_prefix     = var.subnet_address_prefix
}

module "vm" {
  source                  = "./modules/vm"
  vm_name                 = var.vm_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  vm_size                 = var.vm_size
  vm_username             = var.vm_username
  vm_password             = var.vm_password
  subnet_id               = module.vnet.subnet_id
  location_name           = var.location   
  storage_account_name    = module.blob.storage_account_name
  container_name          = module.blob.container_name
}
module "blob" {
  source                   = "./modules/blob"
  storage_account_name     = var.storage_account_name
  container_name           = var.container_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  
}
