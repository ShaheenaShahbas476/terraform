variable "project_name" {
  default = "ai-stamp-rally"
}

variable "environment" {
  default = "prod"
}
variable "resource_group_name" {
  default = "ai-stamp-rally-rg"
}
variable "location" {
  default = "South India"
}

variable "vnet_cidr" {
  default = "10.0.0.0/16"
}

variable "dev_subnet" {
  default = "10.0.1.0/24"
}

variable "prod_subnet" {
  default = "10.0.2.0/24"
}

variable "github_subnet" {
  default = "10.0.3.0/24"
}

variable "vm_size" {
  default = "Standard_B2s"
}
