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