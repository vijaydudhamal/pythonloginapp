terraform {
  backend "azurerm"{
    resource_group_name   = ""
    storage_account_name  = "backendtffile1235"
    conatiner_name        = "prod-tfstate"
    key                   = "prod.terraform.tfstate"
  }
}