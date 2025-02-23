resource "azurerm_mssql_server" "ecomplus_sqlserver" {
  for_each                     = var.ecomplus_sqlserver
  name                         = "${var.project_name}-${each.value.sqlservername}-sqlserver"
  resource_group_name          = "${var.project_name}-${each.value.resource_group_name}-rg"
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}