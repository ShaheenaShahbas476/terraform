resource "azurerm_network_interface" "dev_nic" {
  name                = "${var.prefix}-dev-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.dev_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "runner_nic" {
  name                = "${var.prefix}-runner-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.dev_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "es_nic" {
  name                = "${var.prefix}-es-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.dev_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

###################################
# DEV VM
###################################

resource "azurerm_linux_virtual_machine" "dev_vm" {

  name                = "${var.prefix}-dev-vm"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.dev_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

###################################
# RUNNER VM
###################################

resource "azurerm_linux_virtual_machine" "runner_vm" {

  name                = "${var.prefix}-runner"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.runner_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

###################################
# ELASTICSEARCH VM
###################################

resource "azurerm_linux_virtual_machine" "es_vm" {

  name                = "${var.prefix}-elasticsearch"
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.es_nic.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
