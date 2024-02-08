
variable "location_name" {
  type        = string
  description = "Location of the Virtual Machine"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "vm_location" {
  type        = string
  description = "Location of the Virtual Machine"
}

variable "vm_resource_group_name" {
  type        = string
  description = "Name of the Resource Group for VM"
}

variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
}

variable "vm_username" {
  type        = string
  description = "Username for the Virtual Machine"
}

variable "vm_password" {
  type        = string
  description = "Password for the Virtual Machine"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach the VM to"
}
