output "AppServicePlanId" {
  value = azurerm_service_plan.plan.id 
}

output "ContainerRegistryId" {
  value = azurerm_container_registry.acr.id  
}
output "ResourceGroupName" {
  value = azurerm_resource_group.rg.name
}

output "AzureLocation" {
  value = local.location
}