terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-f4e7a05acafe4bf4"
    storage_account_name  = "backendtffile123575"
    container_name        = "prod-tfstate-1"
    key                   = "prod.terraform.tfstate"
  }
}