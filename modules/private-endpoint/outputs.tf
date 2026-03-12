output "storage_private_endpoint_id" {
  value = azurerm_private_endpoint.storage_private_endpoint.id
}

output "acr_private_endpoint_id" {
  value = azurerm_private_endpoint.acr_private_endpoint.id
}
