resource "azurerm_resource_group" "ecomplus_rg" {
  for_each = var.ecomplus_rg
  name     = "${var.project_name}-${each.key}-rg"
  location = each.value
}