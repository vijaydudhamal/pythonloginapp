# create new resource group

resource "azurerm_resource_gorup" "rg" {
    name       = var.resource_group_name
    location   = var.resource_group_location
}

# create virtual network

resource "azurerm_virtual_network" "vnet" {
    name                = var.virtual_network_name
    resource_group_name = var.resource_group.rg.name
    location            = var.resource_group.rg.location
    address_space       = ["192.68.0.1/24"]
}

# Create subnet

resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    virtual_network      = var.virtual_network.vnet.name
    resource_group_name  = var.resource_group.rg.name
    address_prefex       = ["192.168.0.1/24"]
    
}

# Create public IPs

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

# Create nsg

resource "azurerm_security_group" "nsg" {
    name                = var.network_security_group
    resource_group_name = var.resource_group.rg.name
    location            = var.resurce_group.rg.location

    securit_rule {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "TCP"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"

      name                       = "appallow"
      priority                   = 1003
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "3000-9000"
      source_address_prefix      = "*"
      destination_address_prefix = "*"

    }

}    

# Create NIC

resource "azurerm_network_interface" "nic" {
    name                         = var.network_interface_name
    resource_group_name          = var.resource_group_rg.name
    location                     = var.resource_grou.rg.location
    
    ip_configuration {
        name      = "mynicconfiguration"
        subnet_id = azurerm._subnet.subnet.subnet_id
        private_ip_address_allocation = "Dynamic"
        publice_ip_address_allocation = azurerm_public_ip.public_ip.id
    }

}

# Connect NIC to nsg

resource "azurerm_network_interface_securit_group-association" "associance" {
    network_interface_id = azurerm.network_interface.nic.id
    security_group_id = azurerm.security-group.nsg.id
}

# create the AKS

resource "azurerm_kubernates_cluster" "aks" {
    name             = var.aks_cluster_name
    resourec_group   = azurerm.resource_group.rg.name
    location         = azurerm.resource_group.rg.location
    dns_prefix       = var.aks_cluster_name

    deafault_node_pool {
        name         = "default"
        count_node   = 2
        vm_size      = "Standard_D2s_v3"

    }

    ientity {
        type = "systemAssigned"
    }
}
