resource "azurerm_virtual_network" "vnet" {

  name                = "${var.prefix}-vnet"
  location            = var.location
  resource_group_name = var.resource_group

  address_space = [var.vnet_cidr]

  tags = var.tags
}

resource "azurerm_subnet" "dev" {

  name                 = "dev-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [var.dev_subnet]

}

resource "azurerm_subnet" "prod" {

  name                 = "prod-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [var.prod_subnet]

}

resource "azurerm_subnet" "github" {

  name                 = "github-runner-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [var.github_subnet]

}
resource "azurerm_public_ip" "appgw_ip" {
  name                = "${var.prefix}-gw-ip"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard" # Application Gateway v2 requires Standard SKU
}
