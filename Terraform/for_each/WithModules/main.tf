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


module name {
  source = "../../Modules/StorageAccounts"
  storageAccounts = toset(["storage1","storage2"])
}
