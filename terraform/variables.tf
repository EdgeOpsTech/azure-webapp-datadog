variable "datadog_api_key" {
  type        = string
  description = "Datadog API key used by the Datadog provider and Azure app setting."
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog APP key required by the Datadog Terraform provider."
}

variable "azure_location" {
  type        = string
  description = "Azure region where resources are created."
  default     = "East US"
}

# Existing Resource Group (User must provide this)
variable "existing_resource_group_name" {
  type        = string
  description = "Name of the existing Azure Resource Group."
  default     = "AzureTerraForm-resources" # Change to your actual resource group
}
