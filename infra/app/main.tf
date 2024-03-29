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

    app_settings = {
      WEBSITES_PORT = "8080"
    }
    logs {
        http_logs {
        file_system {
            retention_in_days = 7
            retention_in_mb = 35      
        }
        }
    }
  site_config {
    health_check_path = "/health"
    application_stack {
    
      docker_image_name = "${var.DockerImageName}:${var.DockerImageTag}"
      docker_registry_url = "https://bswebappcontainer.azurecr.io"
      docker_registry_username = var.DockerUserName
      docker_registry_password = var.DockerPassword
    }
  }
}