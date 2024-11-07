output "kube_config" {
  description = "Kube config for AKS"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive   = true
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.name
}
