# variables.tf

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
  default = "roshni-nsg"
}

variable "location" {
  type        = string
  description = "Location of the Network Security Group"
  default = "southeast Asia"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for NSG"
  default = "sa1_test_eic_TejalDave"
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
  default = [
    {
      name                       = "SSH"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "HTTP"
      priority                   = 101
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default = "roshni-vnet"
}
variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet"
  default = "roshni-subnet"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the Subnet"
  default     = ["10.0.2.0/24"]
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
  default = "roshni-vm"
}
variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
  default = "Standard_B2s"
}

variable "vm_username" {
  type        = string
  description = "Username for the Virtual Machine"
  default = "azureuser"
}
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

variable "location_name" {
  type        = string
  description = "Location for resources in the root module"
  default = "southeast Asia"
}
/*
locals {
  ssh_public_key_content = file("/home/roshnipatel/.ssh/id_rsa.pub")
}*/
variable "ssh_public_key" {
  description = "SSH public key for the virtual machine"
  type        = string
  default     = "/home/roshnipatel/.ssh/id_rsa.pub"
}