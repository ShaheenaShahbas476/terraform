resource "azurerm_network_security_group" "dev_nsg" {

  name                = "${var.prefix}-dev-nsg"
  location            = var.location
  resource_group_name = var.resource_group

  tags = var.tags

}

resource "azurerm_network_security_rule" "ssh" {

  name      = "allow-ssh"
  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range      = "*"
  destination_port_range = "22"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.dev_nsg.name

}
