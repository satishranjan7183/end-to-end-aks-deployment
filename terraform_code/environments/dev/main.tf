module "ecomplus_rg_module" {
  source       = "../../modules/1_resource_group"
  ecomplus_rg  = var.ecomplus_rg_mod
  project_name = var.project_name_mod
  environment  = var.environment_mod
}

module "ecomplus_vnet_module" {
  source        = "../../modules/2_virtual_network"
  ecomplus_vnet = var.ecomplus_vnet_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module ]
}

module "ecomplus_acr_module" {
  source = "../../modules/3_acr"
  ecomplus_acr = var.ecomplus_acr_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module ]
}

module "ecomplus_aks_module" {
  source = "../../modules/4_aks"
  ecomplus_aks = var.ecomplus_aks_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module,module.ecomplus_vnet_module ]
}

module "ecomplus_sqlserver_module" {
  source = "../../modules/6_dbserver"
   ecomplus_sqlserver = var.ecomplus_sqlserver_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module,module.ecomplus_vnet_module ]
}

module "ecomplus_sqldb_module" {
  source = "../../modules/7_dbclient"
   ecomplus_sqldb = var.ecomplus_sqldb_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module,module.ecomplus_vnet_module, module.ecomplus_sqlserver_module ]
}

module "ecomplus_sqldbfirewall_module" {
  source = "../../modules/8_dbfirewall"
   ecomplus_sqldbfirewall = var.ecomplus_sqldbfirewall_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module,module.ecomplus_vnet_module, module.ecomplus_sqlserver_module ]
}

module "ecomplus_keyvault_module" {
  source = "../../modules/5_keyvault"
   ecomplus_keyvault = var.ecomplus_keyvault_mod
  project_name  = var.project_name_mod
  environment   = var.environment_mod
  depends_on = [ module.ecomplus_rg_module,module.ecomplus_vnet_module, module.ecomplus_sqlserver_module ]
}