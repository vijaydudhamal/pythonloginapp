variable "resource_group_name"{
    type = string
    description = "it provide the resource group name from .tfvar file
}

variable "resource_group_location" {
    type        = string
    description = " it provide location of resource group from .tfvar file"
}

variable "storage_account" {
    type         = string
    description  = " it provides storage account name "
}

variable "azure_key_vault" {
    type         = string
    description  = " it provides staorage account name"
}

variable "virtual_network_name" {
    type         = string
    description  = "it provides vertual networks'
}

variable "subnet_name" {
    type         = string
    description  = "it provide subenet name "
}

variable "network_security_group" {
    type         = string
    description  = "it provides network_security_group name"
}

variable "public_ip_name" {
    type         = string
    description  = " it provides public_ip_name"
}

variable "network_interface_name" {
    type         = string
    description  = "it provides name for NIC
}

variable "aks_cluster_name" {
    type        = string
    description = "it provides name for AKS"
}