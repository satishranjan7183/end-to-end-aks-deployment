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