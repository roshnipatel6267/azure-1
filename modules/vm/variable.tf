
variable "location_name" {
  type        = string
  description = "Location of the Virtual Machine"
  default = "southeast Asia"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
  default = "roshni-vm"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Machine"
  default = "southeast Asia"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group for VM"
  default = "sa1_test_eic_TejalDave"
}

variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
  default = "Standard_B2s"
}

variable "vm_username" {
  type        = string
  description = "Username for the Virtual Machine"
  default = "ubuntu"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet to attach the VM to"
  default = "roshni-subnet"
}
// variables.tf

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default = "roshnistorage"
}

variable "container_name" {
  description = "Name of the storage container"
  type        = string
  default = "container-roshni"
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