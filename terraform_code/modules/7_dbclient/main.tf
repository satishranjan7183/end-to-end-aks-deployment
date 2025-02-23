data "azurerm_mssql_server" "dataserver" {
  for_each = var.ecomplus_sqldb
    name                = "${var.project_name}-${each.value.sqlservername}-sqlserver"
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
}

resource "azurerm_mssql_database" "sql_db" {
  for_each = var.ecomplus_sqldb
  name                = "${var.project_name}-${each.value.sqldbname}-sqldb"
  # resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  # location            = each.value.location
  server_id         = data.azurerm_mssql_server.dataserver[each.key].id
  # edition             = "Standard"
}

