terraform   {
  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  
    backend "azurerm" {
    resource_group_name  = "testrgnaveen"
    storage_account_name = "testngbackend"
    container_name       = "testbackendcon"
    key                  = "prod.terraform.tfstate"      
    subscription_id      = "10fff678-4b33-4d39-abc9-7482aa52de37"
    tenant_id            = "36da45f1-dd2c-4d1f-af13-5abe46b99921"
  }
}


provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testnaveenrg2" {
  name = var.resource_group_name
  location = var.resource_group_location
}


resource "azurerm_storage_account" "testngstr1" {
  name                     = "mystoreacnew"
  resource_group_name      = azurerm_resource_group.testnaveenrg2.name
  location                 = azurerm_resource_group.testnaveenrg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}