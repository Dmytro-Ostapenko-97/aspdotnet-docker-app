# Create an App Service plan
resource "azurerm_app_service_plan" "service-plan" {
  name                = "aspdotnet-appservice-plan-${var.env}" 
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  kind                = "Linux" 
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }

  tags = {
    user = "dostapenko"  
    app  = "aspdotnet-docker-app"
  } 
}


# Create an App Service
resource "azurerm_app_service" "app_service" {
  name                = "aspdotnet-app-service-${var.env}"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  app_service_plan_id = azurerm_app_service_plan.service-plan.id

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    DOCKER_REGISTRY_SERVER_URL          = var.login_server
    DOCKER_REGISTRY_SERVER_USERNAME     = data.azurerm_key_vault_secret.username.value
    DOCKER_REGISTRY_SERVER_PASSWORD     = data.azurerm_key_vault_secret.password.value
    APPINSIGHTS_INSTRUMENTATIONKEY      = azurerm_application_insights.app-insights.instrumentation_key
  }

  site_config {
    linux_fx_version          = "DOCKER|aspdotnet.azurecr.io/aspdotnetdockerapp-${var.env}:latest"
    use_32_bit_worker_process = true
    app_command_line          = "set APPINSIGHTS_INSTRUMENTATIONKEY=${azurerm_application_insights.app-insights.instrumentation_key}"
  }
 
  identity {
    type = "SystemAssigned"
  }

  tags = {           
    user = "dostapenko"
    app  = "aspdotnet-docker-app"            
 }

 depends_on = [azurerm_application_insights.app-insights]
}
