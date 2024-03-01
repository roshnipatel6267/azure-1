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
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  location                        = var.location_name
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  admin_username                  = var.vm_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.nic.id]

 os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/roshnipatel/.ssh/id_rsa.pub"
      key_data = tls_private_key.ssh_key.public_key_openssh
    }
  }
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

  provisioner "local-exec" {
    command = <<-EOT
      az storage blob upload --account-name ${var.storage_account_name} \
                              --container-name ${var.container_name}  \
                              --name file1.txt \
                              --type block \
                              --content-type "text/plain" \
                              --file ./file1.txt
    EOT
  }
}