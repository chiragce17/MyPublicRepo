output "storageAccountId" {
    value = azurerm_storage_account.StorageAccount.id
} 

output "specific_storageAccount" {
    value = azurerm_storage_account.multipleStorageAccounts["storageAccount1"].id
}

output "multiStorage_replicationType" {
    value = {for k, v in azurerm_storage_account.multipleStorageAccounts : k => v.id}
}