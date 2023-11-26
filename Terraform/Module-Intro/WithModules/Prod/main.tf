module Create-Resourcegroup {
    source = "../../Modules/ResourceGroup"
    resourceGroupName = "prodStorageRG"
    rgLocation = "EastUS"
}

module Create-StorageAccount {
  source = "../../Modules/StorageAccount"

  storageAccountName  = "prodStorageAccount"
  storageResourceGroup = "prodStorageRG"
  storageLocation = "EastUS"
  storageTier = "Standard"
  storageReplicationType = "ZRS"

  depends_on = [
    module.Create-ResourceGroup
  ]
}
