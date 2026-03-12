variable "prefix" {
  description = "Prefix for resource naming"
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

variable "appgw_subnet_id" {
  description = "Subnet ID for Application Gateway"
  type        = string
}

variable "public_ip_id" {
  description = "Public IP address ID for the Application Gateway frontend"
  type        = string
}
