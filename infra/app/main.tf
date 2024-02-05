provider "azurerm" {
  features {
    
  }
}

terraform {
  cloud {
    organization = "BS_INC"

    workspaces {
      name = "TestingAppServicePlanDockerImage-App"
    }
  }
}

resource "azurerm_linux_web_app" "bs-webappcontainer" {
  name                = "bs-webappcontainer"
  resource_group_name = var.ResourceGroupName
  location            = var.AzureLocation
  service_plan_id     = var.AppServicePlanID

  site_config {}
}