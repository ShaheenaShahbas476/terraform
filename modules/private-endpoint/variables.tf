variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Resource group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where private endpoints will be deployed"
  type        = string
}

variable "storage_id" {
  description = "Storage account resource ID"
  type        = string
}

variable "acr_id" {
  description = "Azure Container Registry resource ID"
  type        = string
}
