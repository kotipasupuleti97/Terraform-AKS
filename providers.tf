terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tf-rg"
      storage_account_name = "tfstatestorage124"
      container_name       = "tf-state"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}
