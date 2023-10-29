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

variable storageAccounts {
  type        = list
  default     = ["strgAccount1","strgAccount2"]
}



data "azurerm_storage_account" "StorageAccount" {
   
  for_each = toset(var.storageAccounts)
  name                     = each.key
  resource_group_name      = "StorageAccountTest"
} 

# Enable Diag setting for storage account.
resource "azurerm_monitor_diagnostic_setting" "storage_diag_setting" {
  for_each = toset(var.storageAccounts)
  name               = "${each.key}-diagSetting" 
  target_resource_id = data.azurerm_storage_account.StorageAccount[each.key].id
  log_analytics_workspace_id = "/subscriptions/abcd-efg-hikjl-mnop/resourceGroups/StorageAccountTest/providers/Microsoft.OperationalInsights/workspaces/logAnalyticsWSName"

  metric {
    category = "Transaction"

    retention_policy {
      enabled = false
    }
  }

  depends_on = [data.azurerm_storage_account.StorageAccount]
}