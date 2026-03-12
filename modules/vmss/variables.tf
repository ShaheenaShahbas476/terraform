variable "prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where VMSS instances will be deployed"
  type        = string
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
}

variable "startup_script" {
  description = "Path to VMSS startup script"
  type        = string
}

variable "tags" {
  description = "Tags applied to VMSS"
  type        = map(string)
}
