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

resource "azurerm_resource_group" "Prod-ResourceGroup" {
    count = var.environment == "prod" ? 1:0
    name = var.resourceGroupName
    location = "EastUs"
}


resource "azurerm_resource_group" "NonProd-ResourceGroup" {
    count = var.environment == "nonProd" ? 1:0
    name = var.resourceGroupName
    location = "WestUs"
}
