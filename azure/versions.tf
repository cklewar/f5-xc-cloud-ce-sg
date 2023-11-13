terraform {
  required_version = ">= 1.3.0"

  cloud {
    organization = "cklewar"

    workspaces {
      name = "f5-xc-ce-sg-azure-module"
    }
  }

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "= 0.11.23"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.48.0"
    }

    local = ">= 2.2.3"
    null  = ">= 3.1.1"
  }
}