resource "azurerm_key_vault" "ecomplus_keyvault" {
    for_each            = var.ecomplus_keyvault   
  name                = "${var.project_name}-${each.value.keyvaultname}-keyvault" # The Key Vault name must be globally unique
  location            = each.value.location
  resource_group_name = "${var.project_name}-${each.value.resource_group_name}-rg"
  sku_name            = "standard"  # Can be "standard" or "premium"
  tenant_id           = data.azurerm_client_config.datacleintconfig.tenant_id

  # Access policies (optional, to allow specific users to access the vault)
  access_policy {
    tenant_id = data.azurerm_client_config.datacleintconfig.tenant_id
    object_id = "dbe09070-cac1-4a79-a70d-253189e284f4"  # Replace with your Azure AD user object ID

    key_permissions = [
      "get",
      "list",
      "create",
      "delete"
    ]

    secret_permissions = [
      "get",
      "list",
      "set",
      "delete"
    ]

    certificate_permissions = [
      "get",
      "list",
      "create"
    ]
  }

  tags = {
    environment = "development"
  }
}

# Example to fetch current Azure Client Config (to get the tenant ID)
data "azurerm_client_config" "datacleintconfig" {}