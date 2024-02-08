output "storage_account_name" {
  value = azurerm_storage_container.blob_container.storage_account_name
}

output "container_name" {
  value = azurerm_storage_container.blob_container.name
}