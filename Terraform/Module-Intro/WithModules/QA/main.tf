module Create-Resourcegroup {
    source = "../../Modules/ResourceGroup"
    resourceGroupName = "qaStorageAccount"
    rgLocation = "WestUS"
}

module Create-StorageAccount {
  source = "../../Modules/StorageAccount"
  
  storageAccountName  = "qaStorageAccount"
  storageResourceGroup = "qaStorageRG"
  storageLocation = "WestUS"
  storageTier = "Standard"
  storageReplicationType = "LRS"

  depends_on = [
    module.Create-ResourceGroup
  ]
}