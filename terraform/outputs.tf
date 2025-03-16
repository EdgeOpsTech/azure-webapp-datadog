output "webapp_url" {
  description = "The publicly accessible URL of the deployed Azure Web App."
  value       = "https://${azurerm_app_service.web_app.default_site_hostname}"
}

output "resource_group_name" {
  description = "Azure Resource Group Name"
  value       = data.azurerm_resource_group.rg.name
}

output "datadog_monitor_id" {
  description = "Datadog Monitor ID"
  value       = datadog_monitor.webapp_monitor.id
}
