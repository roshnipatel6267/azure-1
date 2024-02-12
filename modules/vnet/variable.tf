variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Network"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for VNET"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the Subnet"
}
