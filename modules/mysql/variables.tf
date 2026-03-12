variable "resource_group" {
  description = "Resource group where MySQL will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "admin_username" {
  description = "MySQL administrator username"
  type        = string
  default     = "mysqladmin"
}

variable "admin_password" {
  description = "MySQL administrator password"
  type        = string
}

variable "tags" {
  description = "Tags applied to the MySQL server"
  type        = map(string)
}
