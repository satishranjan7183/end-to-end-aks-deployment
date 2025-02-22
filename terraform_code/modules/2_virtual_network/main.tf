resource "azurerm_virtual_network" "ecomplus_vnet" {
  for_each            = var.ecomplus_vnet
  name                = "${var.project_name}-${each.value.vnetname}-vnet"
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  address_space       = each.value.address_space
  location            = each.value.location
  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.subname
      address_prefixes = subnet.value.address_prefixes
    }
  }
}