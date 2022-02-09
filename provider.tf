terraform {
  backend "azurerm" {
    resource_group_name = var.backend_rg
    storage_account_name = var.backend_st
    container_name = var.backend_cn
    key = var.backend_key
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.95.0"
    }
  }
}


provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}
