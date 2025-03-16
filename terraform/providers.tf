terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "datadog" {
  # If you have both keys:
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key

  # If you only have an API key, you can do:
  # api_key  = var.datadog_api_key
  # validate = false  # But many Datadog resources won't work without app_key
}
