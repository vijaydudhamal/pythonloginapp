terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-c41d078df6ac415a"
    storage_account_name  = "backendtffile123575"
    conatiner_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}