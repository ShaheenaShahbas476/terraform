variable "prefix" {
  description = "Prefix for naming resources"
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

variable "vnet_cidr" {
  description = "CIDR range for VNet"
  type        = string
}

variable "dev_subnet" {
  description = "CIDR for development subnet"
  type        = string
}

variable "prod_subnet" {
  description = "CIDR for production subnet"
  type        = string
}

variable "github_subnet" {
  description = "CIDR for GitHub runner subnet"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
