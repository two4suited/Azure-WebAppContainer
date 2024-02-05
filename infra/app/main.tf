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

data "tfe_outputs" "InfrastructureOutput"{
    organization = "BS_INC"
    workspace = "TestingAppServicePlanDockerImage-Infrastructure"
}

resource "azurerm_linux_web_app" "bs-webappcontainer" {
  name                = "bs-webappcontainer"
  resource_group_name = data.tfe_outputs.InfrastructureOutput.values.ResourceGroupName
  location            = data.tfe_outputs.InfrastructureOutput.values.AzureLocation
  service_plan_id     = data.tfe_outputs.InfrastructureOutput.values.AppServicePlanId

  site_config {
    application_stack {
      docker_image_name = "${var.DockerRegistry}/${var.DockerImageName}:${var.DockerImageTag}"
      docker_registry_url = "https://bswebappcontainer.azurecr.io"
      docker_registry_username = var.DockerUserName
      docker_registry_password = var.DockerPassword
    }
  }
}