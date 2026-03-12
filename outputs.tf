output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "vmss_id" {
  value = module.vmss.vmss_id
}
