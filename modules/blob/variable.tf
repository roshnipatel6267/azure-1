
variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"
  default = "roshnistorage"
}

variable "container_name" {
  type        = string
  description = "Name of the Blob Container"
  default = "container-roshni"

}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for Blob Storage"
  default = "sa1_test_eic_TejalDave"
}

variable "location" {
  type        = string
  description = "Location of the Blob Storage"
  default = "southeast Asia"
}
