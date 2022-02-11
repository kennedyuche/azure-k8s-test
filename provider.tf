terraform {
  backend "azurerm" {
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
    storage_account_name    = var.storage_account_name
    container_name          = var.storage_account_container
    key                     = var.storage_key
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
