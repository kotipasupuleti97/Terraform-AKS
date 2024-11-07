module "aks_cluster" {
  source               = "./modules/aks"
  location             = var.location
  resource_group_name  = var.resource_group_name
  cluster_name         = var.cluster_name
  dns_prefix           = var.dns_prefix
  default_node_count   = var.default_node_count
  default_vm_size      = var.default_vm_size
  auto_scaling_enabled = var.auto_scaling_enabled
  default_min_count    = var.default_min_count
  default_max_count    = var.default_max_count
  tags                 = var.tags

  node_pools = [
    {
      name                 = "nodepool1"
      vm_size              = var.default_vm_size
      node_count           = var.default_node_count
      auto_scaling_enabled = var.auto_scaling_enabled
      min_count            = var.default_min_count
      max_count            = var.default_max_count
      availability_zones   = ["1"]
    },
    {
      name                 = "nodepool2"
      vm_size              = var.default_vm_size
      node_count           = var.default_node_count
      auto_scaling_enabled = var.auto_scaling_enabled
      min_count            = var.default_min_count
      max_count            = var.default_max_count
      availability_zones   = ["2"]
    },
    {
      name                = "nodepool3"
      vm_size             = var.default_vm_size
      node_count          = var.default_node_count
      auto_scaling_enabled = var.auto_scaling_enabled
      # enable_auto_scaling = var.auto_scaling_enabled
      min_count           = var.default_min_count
      max_count           = var.default_max_count
      availability_zones  = ["3"]
    },
  ]
}
