output "dev_vm_id" {
  value = azurerm_linux_virtual_machine.dev_vm.id
}

output "runner_vm_id" {
  value = azurerm_linux_virtual_machine.runner_vm.id
}

output "elasticsearch_vm_id" {
  value = azurerm_linux_virtual_machine.es_vm.id
}
