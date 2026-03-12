variable "resource_group" {
  description = "Resource group where ACR will be deployed"
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
