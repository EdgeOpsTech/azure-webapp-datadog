variable "datadog_api_key" {
  description = "Datadog API Key"
  type        = string
}

variable "azure_location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
