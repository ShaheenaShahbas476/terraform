output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "dev_subnet_id" {
  value = azurerm_subnet.dev.id
}

output "prod_subnet_id" {
  value = azurerm_subnet.prod.id
}

output "github_subnet_id" {
  value = azurerm_subnet.github.id
}
output "appgw_subnet_id" {
  value = azurerm_subnet.prod.id # Replace with actual resource name
}

output "appgw_public_ip_id" {
  value = azurerm_public_ip.appgw_ip.id # Replace with actual resource name
}
