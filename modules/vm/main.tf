# Define the network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location_name
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Define the public IP address
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}-ip"
  location            = var.location_name
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

# Create a virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location_name
  resource_group_name             = var.resource_group_name
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
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"  
  version   = "latest"
}


  tags = {
    name  = "resource-owner"
    owner = "roshni-einfochips.com"
  }
#custom_data = filebase64("${path.module}/modules/vm/azure_cli_login.sh")
  
custom_data = filebase64("${path.module}/azure_cli_login.sh")
/*
 provisioner "local-exec" {
  command = <<-EOT
    az storage blob upload --account-name roshnitest11 \
                            --container-name roshni-container \
                            --name file1.txt \
                            --type block \
                            --content-type "text/plain" \
                            --account-key R0Mfp6Ulb/XMN2+/85yNA3jbivZiTzCARc7vklihm6BESWz1JcqbDWpCo3xbCKfDI05CivFA0Wfl+AStqoxQiw== \
                            --content-encoding "gzip" \
                            --file ./file1.txt
  EOT
}*/
/*
 provisioner "local-exec" {
    command = <<-EOT
      storage_access_key=$(terraform output storage_access_key)
      ssh ${azurerm_linux_virtual_machine.vm.admin_username}@${azurerm_public_ip.public_ip.ip_address} \
        az storage blob upload \
          --account-name ${var.storage_account_name} \
          --container-name ${var.container_name} \
          --name file1.txt \
          --type block \
          --account-key $storage_access_key \
          --content-type "text/plain" \
          --content-encoding "gzip" \
          --file ./file1.txt
    EOT
  }*/
}