resource "azurerm_storage_account" "prodStorageAccount" {
  name                     = "prodStorageAccount"
  resource_group_name      = "prodStorageRG"
  location                 = "EastUS"
  account_tier             = "Standard"
  account_replication_type = "ZRS"
}