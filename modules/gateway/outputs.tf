output "gateway_id" {
  value = azurerm_application_gateway.gateway.id
}

output "backend_pool_name" {
  value = "vmss-backend"
}
