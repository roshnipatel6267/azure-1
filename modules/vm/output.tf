output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
/*
output "storage_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}*/
/*
output "tls_private_key" {
  value     = tls_private_key.secureadmin_ssh.private_key_pem
  sensitive = true
}*/
output "ssh_public_key" {
  value = tls_private_key.ssh_key.public_key_openssh
  sensitive = true
}