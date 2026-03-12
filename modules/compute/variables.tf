variable "prefix" {
  description = "Resource naming prefix"
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

variable "dev_subnet_id" {
  description = "Subnet ID where VMs will be deployed"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "ssh_public_key" {
  description = "Path to SSH public key"
  type        = string
}
