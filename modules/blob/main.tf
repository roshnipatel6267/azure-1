provider "azurerm" {
 features {}  # Specify your Azure provider configuration
 
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = "East US"  # Adjust the location accordingly
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob_container" {
  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = "private"
}


resource "azurerm_storage_blob" "roshni-blob" {
  name                   = "file2.txt"
  storage_account_name   = module.storage_account.account_name
  storage_container_name = module.blob_container.container_name
  type                   = "Block"
  source                 = "./file/file2.txt"  # Adjust the source path accordingly
}
