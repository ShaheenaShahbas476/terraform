variable "prefix" {
  description = "Prefix used for resource naming"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tags" {
  description = "Tags applied to resources"
  type        = map(string)
}
