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

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
}
