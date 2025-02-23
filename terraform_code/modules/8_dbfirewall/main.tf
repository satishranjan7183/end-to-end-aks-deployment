data "azurerm_mssql_server" "dataserver" {
  for_each = var.ecomplus_sqldbfirewall
    name                = "${var.project_name}-${each.value.sqlservername}-sqlserver"
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
}

resource "azurerm_mssql_firewall_rule" "firewall_rule" {
   for_each = var.ecomplus_sqldbfirewall
  name                = "${var.project_name}-${each.value.sqldbfirewallname}-sqldbfirewall"
  # resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  # server_name         = data.azurerm_mssql_server.dataserver.name
  server_id = data.azurerm_mssql_server.dataserver[each.key].id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}