resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = var.azure_location
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "example-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "web_app" {
  name                = "example-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "PYTHON|3.9"
  }

  app_settings = {
    "DATADOG_API_KEY" = var.datadog_api_key
  }
}

resource "datadog_monitor" "webapp_monitor" {
  name    = "Azure Web App Health Check"
  type    = "metric alert"
  query   = "avg(last_5m):avg:azure.app_service.requests.count{resource_group:example-resources} > 100"
  message = "High request count detected!"
  tags    = ["webapp", "azure"]
}
