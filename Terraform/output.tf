output "public_ip_id" {
    value = azurerm_public_ip.public_ip.id
}

output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.aks.name
}

