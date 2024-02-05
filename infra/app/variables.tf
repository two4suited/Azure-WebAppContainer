variable "DockerRegistry" {
  description = "Docker registry"
  type        = string
}

variable "DockerUserName" {
  type = string
  description = "value of the docker username"
}

variable "DockerPassword" {
  type = string
  description = "value of the docker password"
}

variable "DockerImageTag" {
  type = string
  description = "value of the docker image tag"
}

variable "DockerImageName" {
  type = string
  description = "value of the docker image name"
}

variable "AppServicePlanID" {
  type = string
  description = "value of the app service plan id"
}

variable "AzureLocation" {
  type = string
    description = "value of the azure location"
}
variable "ResourceGroupName" {
  type=string
    description="value of the resource group name"
}