terraform {
  backend "azurerm"{
    resource_group_name   = "kml_rg_main-041bf948a9b44cb4"
    storage_account_name  = "backendtffile1235"
    conatiner_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}