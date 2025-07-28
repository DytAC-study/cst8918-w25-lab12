resource "azurerm_resource_group" "app_rg" {
  name     = "0411175585-a12-rg"
  location = "canadaeast"
  tags = {
    Environment = "production"
    Project     = "cst8918-lab12"
  }
}
