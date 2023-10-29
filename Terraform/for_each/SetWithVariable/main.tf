terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_storage_account" "StorageAccount" {
   
  for_each = toset(var.storageAccounts)

  name                     = each.key
  resource_group_name      = "testRG"
  location                 = "eastUS"
  account_tier             = "Standard"
  account_replication_type = "LRS"
} 