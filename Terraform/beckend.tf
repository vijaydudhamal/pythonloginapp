terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-0a94322369a54d58"
    storage_account_name  = "backendtffile123575"
    container_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}