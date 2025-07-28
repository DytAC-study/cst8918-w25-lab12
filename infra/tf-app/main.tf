resource "azurerm_resource_group" "app_rg" {
  name     = "0411175585-a12-rg"
  location = var.location
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
