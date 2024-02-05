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
  sensitive = true
}

variable "DockerImageTag" {
  type = string
  description = "value of the docker image tag"
}

variable "DockerImageName" {
  type = string
  description = "value of the docker image name"
}

