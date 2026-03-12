resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_mysql_flexible_server" "mysql" {

  name                = "aisr-mysql-${random_string.suffix.result}"
  resource_group_name = var.resource_group
  location            = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name = "B_Standard_B1ms"

  version = "8.0.21"

  storage {
    size_gb = 32
  }
  backup_retention_days = 7

  tags = var.tags
}
