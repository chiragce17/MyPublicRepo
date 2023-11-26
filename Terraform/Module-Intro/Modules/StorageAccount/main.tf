resource "azurerm_storage_account" "prodStorageAccount" {
  name                     = var.storageAccountName
  resource_group_name      = var.storageResourceGroup
  location                 = var.storageLocation
  account_tier             = var.storageTier
  account_replication_type = var.storageReplicationType
}