locals {

  prefix = "${var.project_name}-${var.environment}"

  tags = {

    Project     = "AI Stamp Rally"
    Environment = var.environment
    Owner       = "DevOps"
    ManagedBy   = "Terraform"

  }

}
resource "random_string" "suffix" {

  length  = 5
  special = false
  upper   = false

}
