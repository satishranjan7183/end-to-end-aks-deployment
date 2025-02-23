variable "ecomplus_rg_mod" {
  type = map(any)
}
variable "project_name_mod" {
  description = "The name of the project"
  type        = string
  default     = "myapp"
}
variable "environment_mod" {
  description = "The environment (e.g., dev, prod, test)"
  type        = string
  default     = "dev"
}


variable "ecomplus_vnet_mod" {
  type = map(any)
}


variable "ecomplus_acr_mod" {
  type = map(any)
}

variable "ecomplus_aks_mod" {
  type = map(any)
}

variable "ecomplus_sqlserver_mod" {
  type = map(any)
}

variable "ecomplus_sqldb_mod" {
  type = map(any)
}

variable "ecomplus_sqldbfirewall_mod" {
  type = map(any)
}

variable "ecomplus_keyvault_mod" {
  type = map(any)
}