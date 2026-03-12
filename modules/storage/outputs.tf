output "storage_account_id" {
  value = azurerm_storage_account.storage.id
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "scripts_container_name" {
  value = azurerm_storage_container.scripts.name
}
