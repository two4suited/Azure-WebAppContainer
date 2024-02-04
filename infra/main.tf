provider "azurerm" {
  features {
    
  }
}

terraform {
  cloud {
    organization = "BS_INC"

    workspaces {
      name = "TestAppPlanImage"
    }
  }
}

locals {
  location = "westus2"
  resource_group_name = "rg-webappcontainer"
  app_service_plan_name = "asp-webappcontainer"
  app_service_name = "app-webappcontainer"
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_app_service_plan" "plan" {
  location            = local.location
  name                = local.app_service_plan_name
  resource_group_name = local.resource_group_name
  kind                = "Linux"
  sku {
    tier = "Basic"
    size = "B1"
  }
}