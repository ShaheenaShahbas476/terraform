resource "azurerm_private_endpoint" "storage_private_endpoint" {

  name                = "storage-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group

  subnet_id = var.subnet_id

  private_service_connection {

    name                           = "storage-connection"
    private_connection_resource_id = var.storage_id
    is_manual_connection           = false
    subresource_names              = ["blob"]

  }

}

resource "azurerm_private_endpoint" "acr_private_endpoint" {

  name                = "acr-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group

  subnet_id = var.subnet_id

  private_service_connection {

    name                           = "acr-connection"
    private_connection_resource_id = var.acr_id
    is_manual_connection           = false
    subresource_names              = ["registry"]

  }

}
