# Use an existing Azure Resource Group
data "azurerm_resource_group" "rg" {
  name = var.existing_resource_group_name
}

# Generate a unique suffix for Web App Name
resource "random_id" "suffix" {
  byte_length = 4 # Generates a short random string (e.g., "a1b2")
}

# ✅ Fix: Correctly Define App Service Plan (Required os_type & sku_name)
resource "azurerm_service_plan" "app_service_plan" {
  name                = "example-plan-${random_id.suffix.hex}" # Unique name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Linux" # ✅ Fix: Added required os_type
  sku_name            = "B1"    # ✅ Fix: Use sku_name instead of sku block
}

# ✅ Fix: Correctly Define App Service with `app_service_plan_id`
resource "azurerm_app_service" "web_app" {
  name                = "example-webapp-${random_id.suffix.hex}" # Unique Name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_service_plan.id # ✅ Fix: Correct attribute name

  site_config {
    linux_fx_version = "PYTHON|3.9"
  }

  app_settings = {
    "DATADOG_API_KEY" = var.datadog_api_key
  }

  lifecycle {
    ignore_changes = [app_settings] # Prevent unnecessary redeployment
  }
}

# ✅ Fix: Correctly Define Datadog Monitor
resource "datadog_monitor" "webapp_monitor" {
  name    = "Azure Web App Health Check"
  type    = "metric alert"
  query   = "avg(last_5m):avg:azure.app_service.requests.count{resource_group:${var.existing_resource_group_name}} > 100"
  message = "High request count detected!"
  tags    = ["webapp", "azure"]

  lifecycle {
    ignore_changes = [query] # Prevent unnecessary re-creation
  }
}
