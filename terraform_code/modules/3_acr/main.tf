resource "azurerm_container_registry" "acr" {
  for_each                 = var.ecomplus_acr  
  name                     = "${var.project_name}${each.value.acrname}acr"
  resource_group_name      = "${var.project_name}-${each.value.resource_group_name}-rg"
  location                 = each.value.location
  sku                      = "Basic"
  admin_enabled            = true
}