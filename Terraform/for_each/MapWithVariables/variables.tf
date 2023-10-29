variable "storageAccounts" {
    type = map
    default = {
        "storageaccount1" = "LRS"
        "storageaccount2" = "GRS"
    }
}