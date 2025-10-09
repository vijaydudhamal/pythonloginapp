terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-5eb40459c15b4941"
    storage_account_name  = "backendtffile123575"
    container_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}