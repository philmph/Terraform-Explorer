terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.115.0, < 4.0.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "name" {
  default     = "example"
  description = "The name for the resources"
  type        = string
}

# Add random characters to the storage account name to ensure it is unique
resource "random_string" "this" {
  count = 0

  length = 24 - 2 - length(var.name)

  special = false
  upper   = false
}

locals {
  resource_group_name  = "rg-${var.name}"
  storage_account_name = "sa${var.name}${random_string.this.result}"
}

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = "westeurope"
}

resource "azurerm_storage_account" "this" {
  count = 0

  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
