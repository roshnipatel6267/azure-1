# create a virtual network and a subnet

resource "azurerm_virtual_network" "vnet" {
name = "vnet"
location = var.vnet_location
resource_group_name = var.vnet_resource_group_name
address_space = ["10.0.0.0/16"]
}

/*resource "azurerm_subnet" "mysubnetazure" {
name = "mysubnetazure"
resource_group_name = var.vnet_resource_group_name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = "10.0.1.0/24"
}*/

# Example subnet declaration in modules/vnet/main.tf
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = var.vnet_resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.2.0/24"]
}

#output for subnet id 
 output "subnet_id" {
   value = azurerm_subnet.subnet.id
} 
