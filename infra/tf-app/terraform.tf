terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "0411175585-githubactions-rg"
    storage_account_name = "0411175585githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
  tenant_id = "e39de75c-b796-4bdd-888d-f3d21250910c"
  client_id = "07eb766c-5e67-4475-bb20-a61bf56be49b"
}
