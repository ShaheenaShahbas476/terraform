resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
resource "azurerm_container_registry" "prod_acr" {

  name                = "aistamprally${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group

  sku = "Premium"

  admin_enabled = true

  tags = var.tags

}
resource "azurerm_container_registry" "dev_acr" {

  name                = "aistamprallydev${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group

  sku = "Premium"

  admin_enabled = true

  tags = var.tags

}
