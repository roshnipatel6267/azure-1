
variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "container_name" {
  type        = string
  description = "Name of the Blob Container"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for Blob Storage"
}

variable "location" {
  type        = string
  description = "Location of the Blob Storage"
}