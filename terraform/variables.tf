variable "datadog_api_key" {
  type        = string
  description = "Datadog API key used by the Datadog provider and Azure app setting."
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application key required by the Datadog provider."
}

variable "azure_location" {
  type        = string
  description = "Azure region where resources are created."
  default     = "eastus"
}
