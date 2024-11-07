resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = "default"
    node_count          = var.default_node_count
    vm_size             = var.default_vm_size
    min_count           = var.default_min_count
    max_count           = var.default_max_count
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# Loop to create multiple node pools
resource "azurerm_kubernetes_cluster_node_pool" "node_pools" {
  count                 = length(var.node_pools)
  name                  = var.node_pools[count.index].name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = var.node_pools[count.index].vm_size
  node_count            = var.node_pools[count.index].node_count
  min_count             = var.node_pools[count.index].min_count
  max_count             = var.node_pools[count.index].max_count
  orchestrator_version  = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
  zones                 = var.node_pools[count.index].availability_zones
}
