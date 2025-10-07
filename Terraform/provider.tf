provider "azurerm" {
    features {}
}

terraform {
    required_providers "azurerm" {
        azurerm = {
            source     = "hashicorp/azurerm"
            version    = "3.0.0"
        }
    }
}