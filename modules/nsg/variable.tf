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
