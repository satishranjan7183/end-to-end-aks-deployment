terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "38d52de4-2fb6-4a85-96fb-5ba22d363e4e"
}