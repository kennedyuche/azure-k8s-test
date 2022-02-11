data "azurerm_kubernetes_service_versions" "current" {
  location            = var.resource_group_location
}


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.cluster_name}-cluster"
  location            = var.resource_group_locaton
  resource_group_name = var.resource_group_name
  dns_prefix          = "k8scluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version

  default_node_pool {
    availability_zones  = [1]
    name                = var.node_pool_name
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    node_count          = var.node_pool_count
    vm_size             = var.node_pool_vm_size
    type                = "VirtualMachineScaleSets"
    os_disk_size_gb     = var.node_pool_osdisk_size
    enable_auto_scaling = true
    max_count           = var.node_pool_max_count
    min_count           = var.node_pool_min_count
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      default_node_pool[1],
    ]
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
  }

  # identity {
  #  type = "SystemAssigned"
  #}

  tags = {
    Environment = var.env
  }
}