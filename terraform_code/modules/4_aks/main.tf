data "azurerm_subnet" "subnetdata" {
  for_each            = var.ecomplus_aks   
  name = each.value.subnetname
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  virtual_network_name = "${var.project_name}-${each.value.vnetname}-vnet"
}

resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.ecomplus_aks  
  name                = "${var.project_name}-${each.value.aksname}-aks"
  location            = each.value.location
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = "1.29.6"
  
  default_node_pool {
    name        = "default"
    node_count  = 2
    vm_size     = "Standard_DS2_v2"
    vnet_subnet_id = data.azurerm_subnet.subnetdata[each.key].id
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "production"
  }

  # Enable Private DNS integration
  private_cluster_enabled = true

}