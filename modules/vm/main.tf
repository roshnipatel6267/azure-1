
 
# Define the network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location_name
  resource_group_name = var.vm_resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    #subnet_id                     = azurerm_subnet.subnet.id  # Replace with the actual subnet ID
    #subnet_id = module.vm.subnet_id  
    subnet_id = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Define the public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}-ip"
  location            = var.location_name
  resource_group_name = var.vm_resource_group_name
  allocation_method   = "Dynamic"
}
# create a virtual machine and a public IP address

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location_name
  resource_group_name             = var.vm_resource_group_name
  size                            = var.vm_size
  admin_username                  = var.vm_username
  admin_password                  = var.vm_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer = "UbuntuServer"
    sku = "20_04-lts" 
    version = "latest"
  }

  tags = {
   name = "resource-owner"
   owner = roshni-einfochips.com 

  }
  }