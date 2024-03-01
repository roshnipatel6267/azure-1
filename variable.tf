# variables.tf

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "location" {
  type        = string
  description = "Location of the Network Security Group"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for NSG"
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "List of rules for the Network Security Group"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
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

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}
variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
}

variable "vm_username" {
  type        = string
  description = "Username for the Virtual Machine"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"
}

variable "container_name" {
  type        = string
  description = "Name of the Blob Container"
}

variable "location_name" {
  type        = string
  description = "Location for resources in the root module"
}


