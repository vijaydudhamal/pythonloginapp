terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-bfd4c4f26f0b42d7"
    storage_account_name  = "backendtffile123575"
    container_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}