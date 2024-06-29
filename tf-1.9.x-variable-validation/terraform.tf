terraform {
  # Required to be 1.9.0 or higher for cross object variable validation
  required_version = ">= 1.9.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.2, < 4.0.0"
    }
  }
}
