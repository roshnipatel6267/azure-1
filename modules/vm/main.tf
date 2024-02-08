# Define the network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location_name
  resource_group_name = var.vm_resource_group_name

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
  resource_group_name = var.vm_resource_group_name
  allocation_method   = "Dynamic"
}

# Create a virtual machine
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
/*
  source_image_reference {
    publisher = "canonical"
    offer     = "UbuntuServer"
    sku       = "20_04-lts" 
    version   = "latest"
  }
*/

  source_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18.04-LTS"  # or any other available SKU
  version   = "latest"
}


  tags = {
    name  = "resource-owner"
    owner = "roshni-einfochips.com"
  }
  /*
provisioner "local-exec" {
  command = <<EOT
    ./azure_cli_login.sh > azure_cli_log.txt 2>&1
  EOT
}
*/
/*
provisioner "local-exec" {
    command = <<-EOT
      # Install Azure CLI
      sudo apt-get update
      sudo apt-get install -y azure-cli

      # Log in to Azure (you might need to follow the interactive prompt)
      az login

      # Upload file1.txt to Blob Storage
      az storage blob upload --account-name roshnitest11 --container-name roshni-container --name file1.txt --type block --content-type "text/plain" --account-key <storage_account_key> --type block --content-type "text/plain" --content-encoding "gzip" --file ./file/file1.txt

      # Upload file2.txt to Blob Storage
      #az storage blob upload --account-name roshnitest11 --container-name roshni-container --name file2.txt --type block --content-type "text/plain" --account-key <storage_account_key> --type block --content-type "text/plain" --content-encoding "gzip" --file ./file/file2.txt
    EOT
  }
*/
}
resource "null_resource" "provisioner" {
  depends_on = [
    azurerm_linux_virtual_machine.vm,
  ]
/*
  provisioner "file" {
    source      = "./modules/vm/ssh-keys/terraform-azure.pem"
    destination = "/vm/ssh-keys/terraform-azure.pem"
  }
*/
  provisioner "remote-exec" {
    inline = [
      "chmod 600 /vm/ssh-keys/terraform-azure.pem",  # Correct the path inside the VM
      "sudo apt-get update",
      "sudo apt-get install -y azure-cli",
      "az login",
      "az storage blob upload --account-name roshnitest11 --container-name roshni-container --name file1.txt --type block --content-type 'text/plain' --account-key alhsxRVch5uUDjQGlndngQV0ldfbaN3MUXs48QgDcKNVHV/wXc1BQMKiWlpLGX6i9Vm9kOnmWpJb+ASt/s2smw== --type block --content-type 'text/plain' --content-encoding 'gzip' --file /file/file1.txt", 
    ]

    connection {
      type        = "ssh"
      user        = azurerm_linux_virtual_machine.vm.admin_username
      private_key = file("./modules/vm/ssh-keys/terraform-azure.pem")
      host        = azurerm_linux_virtual_machine.vm.public_ip_address
    }
  }
}




