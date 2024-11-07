variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  # default = "CentralIndia"
}

variable "resource_group_name" {
  description = "Name of the resource group for the AKS cluster."
  type        = string
  # default = "aks_ckuster_rg"
}

variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
  # default = "aks-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
  # default = "akscluster"
}

variable "default_node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
  # default     = 1
}

variable "default_vm_size" {
  description = "VM size for the default node pool."
  type        = string
  # default     = "Standard_D2s_v3"
}

variable "auto_scaling_enabled" {
  description = "Whether to enable auto-scaling for the default node pool."
  type        = bool
  # default     = true
}

variable "default_min_count" {
  description = "Minimum node count for the default node pool when auto-scaling is enabled."
  type        = number
  # default     = null
}

variable "default_max_count" {
  description = "Maximum node count for the default node pool when auto-scaling is enabled."
  type        = number
  # default     = null
}



variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  # default = {
  #   "env" = "production"
  # }
}

