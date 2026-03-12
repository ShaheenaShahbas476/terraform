resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "storage" {

  name                = "aisr${random_string.suffix.result}"
  resource_group_name = var.resource_group
  location            = var.location

  account_tier             = "Standard"
  account_replication_type = "LRS"


  tags = var.tags
}

resource "azurerm_storage_container" "scripts" {

  name                  = "startup-scripts"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"



}
