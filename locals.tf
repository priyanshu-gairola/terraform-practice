locals {
  environment = terraform.workspace == "default" ? "prod" : terraform.workspace

  name_prefix = "${local.environment}-"

  common_tags = {
    Environment = local.environment
    Project     = "terraform-practice"
    ManagedBy   = "Terraform"
  }
}