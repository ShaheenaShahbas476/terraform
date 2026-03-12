resource "azurerm_linux_virtual_machine_scale_set" "vmss" {

  name                = "${var.prefix}-vmss"
  location            = var.location
  resource_group_name = var.resource_group

  sku       = "Standard_B2s"
  instances = 1

  admin_username = "azureuser"

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = var.subnet_id
      primary   = true
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  custom_data = base64encode(file(var.startup_script))

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = var.tags

}
