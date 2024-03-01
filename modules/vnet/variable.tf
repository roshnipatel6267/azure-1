variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
  default = "roshni-vnet"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Network"
  default = "southeast Asia"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for VNET"
  default = "sa1_test_eic_TejalDave"
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
