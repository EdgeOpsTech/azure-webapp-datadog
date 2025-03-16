output "webapp_url" {
  description = "Azure Web App default site hostname"
  value       = azurerm_app_service.web_app.default_site_hostname
}
