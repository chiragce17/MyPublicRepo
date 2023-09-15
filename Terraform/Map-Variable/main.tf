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

resource "azurerm_resource_group" "resourceGroup" {
    name = "mapResourceGroup"
    location = "eastus"
}


resource "azurerm_storage_account" "StorageAccount" {
   name = var.storageProperties["storageName"]
   resource_group_name = azurerm_resource_group.resourceGroup.name
   location  = var.storageProperties["location"]
   account_tier = var.storageProperties["account_tier"]
   account_replication_type  = var.storageProperties["replication_type"]
} 

resource "azurerm_storage_account" "multipleStorageAccounts" {
   for_each = var.storageAccountNames
   name = "${each.value}"
   resource_group_name = azurerm_resource_group.resourceGroup.name
   location  = var.storageProperties["location"]
   account_tier = var.storageProperties["account_tier"]
   account_replication_type  = var.storageProperties["replication_type"]
}