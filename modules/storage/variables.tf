variable "resource_group" {
  description = "Resource group where the storage account will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags applied to the storage account"
  type        = map(string)
}
