resource "azurerm_private_dns_zone" "acr_dns" {
  name                = "privatelink.azurecr.io"
  resource_group_name = var.resource_group
}

resource "azurerm_private_dns_zone" "blob_dns" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group
}
