resource "azurerm_storage_account" "qaStorageAccount" {
  name                     = "qaStorageAccount"
  resource_group_name      = "qaStorageRG"
  location                 = "WestUS"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}