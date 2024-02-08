module "nsg" {
  source   = "./modules/nsg"
  nsg_name = "nsg"
  nsg_rules = [
    {
      name                       = "SSH"
      priority                   = 100
      direction                  = "inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 101
      direction                  = "inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}


module "vnet" {
  source    = "./modules/vnet"
  vnet_name = "my-vnet"
  subnet_name           = "mysubnetazure"  
  subnet_address_prefix = ["10.0.1.0/24"]  
  vnet_address_space    = "10.0.0.0/16" 
}

locals {
  subnet_id = azurerm_subnet.subnet.id
}

module "vm" {
  source  = "./modules/vm"
  vm_name = "ubuntu-server"
  #subnet_id = azurerm_subnet.subnet.id
  #subnet_id = module.vm.subnet_id  
  subnet_id = azurerm_subnet.subnet.id
 }


module "blob" {
  source  = "./modules/blob"
  storage_account_name   = module.azurerm_storage_container.name 
  container_name        = module.zurerm_storage_blob.name
  resource_group_name = module.azurerm_resource_group.name
}