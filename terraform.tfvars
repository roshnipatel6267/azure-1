# terraform.tfvars

# Network Security Group (NSG) variables
nsg_name                    = "nsg"
nsg_location                = "southeast Asia"
nsg_resource_group_name     = "sa1_test_eic_TejalDave"
nsg_rules = [
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

# Virtual Network (VNET) variables
vnet_name                   = "my-vnet"
vnet_location               = "southeast Asia"
vnet_resource_group_name    = "sa1_test_eic_TejalDave"
vnet_address_space          = ["10.0.0.0/16"]
subnet_name                 = "subnet"
subnet_address_prefix       = ["10.0.2.0/24"]


# Virtual Machine (VM) variables
vm_name                     = "ubuntu-server"
vm_location                 = "southeast Asia"
vm_resource_group_name      = "sa1_test_eic_TejalDave"
vm_size                     = "Standard_B1s"
vm_username                 = "roshni-ubuntu"
vm_password                 = "Complex@password"
location_name               = "southeast Asia"





# Blob Storage variables
storage_account_name        = "roshnitest11"
container_name              = "roshni-container"
resource_group_name         = "sa1_test_eic_TejalDave"
location                    = "southeast asia"


