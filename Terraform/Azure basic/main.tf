# Defines Terraform settings.
terraform {
  # Defines which providers wills be used to provision the infrastructure.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  # Sets the version of Terraform that can be used.
  required_version = ">= 1.1.0"

  # ONLY NEEDED FOR HCP. Can be run locally without this.
  cloud {
    organization = "WaiHF"
    workspaces {
      name = "learn-terraform-azure"
    }
  }

}

# Defines provider settings.
provider "azurerm" {
  features {}
}

# Creates a resource group.
resource "azurerm_resource_group" "rg" {
  # Uses variable set in the variables.tf file to set the resource group name.
  name     = var.resource_group_name
  location = "uksouth"

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# Creates a virtual network.
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}

# Create a network watcher, as a new resource group is generated automatically if this is not present. Easier clean up.
resource "azurerm_network_watcher" "netwatcher" {
  name                = "myTFNetWatcher"
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}
