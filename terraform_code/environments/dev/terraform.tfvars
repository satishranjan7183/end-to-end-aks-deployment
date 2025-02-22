project_name_mod = "ecomplus"
environment_mod  = "dev"

ecomplus_rg_mod = {
  dev = "East US"
  #   prod = "West US"
  #   test = "Central US"
}

ecomplus_vnet_mod = {
  vnet1 = {
    vnetname            = "dev"
    location            = "East US"
    resource_group_name = "dev"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      snet1 = {
        subname          = "snet1_vm"
        address_prefixes = ["10.0.0.0/24"]
      }
      snet2 = {
        subname          = "snet2_bastion"
        address_prefixes = ["10.0.1.0/24"]
      }
      snet3 = {
        subname          = "snet3_aks"
        address_prefixes = ["10.0.2.0/24"]
      }
      snet4 = {
        subname          = "snet3_webapp"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
}

ecomplus_acr_mod = {
  acr1 = {
  acrname                  = "dev"
  resource_group_name      = "dev"
  location                 = "East US"
  }
}

ecomplus_aks_mod = {
  aks1 = {
  aksname                  = "dev"
  resource_group_name      = "dev"
  location                 = "East US"
  vnetname = "dev"
  dns_prefix = "ecomplusakscluster"
  subnetname = "snet3_aks"
  virtual_network_name = "dev"
  }
}