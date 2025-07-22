provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "TEST-rg"
  location = var.location
  tags = var.tags
}
resource "azurerm_virtual_network" "vnet" {
  name                = "TEST-vn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = var.tags
}

resource "azurerm_resource_group" "nw_rg" {
  name     = "NetworkWatcherRG"
  location = var.location
}
resource "azurerm_network_watcher" "NetworkWatcher_uksouth" {
  name                = "NetworkWatcher_uksouth"
  location            = azurerm_resource_group.nw_rg.location
  resource_group_name = azurerm_resource_group.nw_rg.name
}

output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "vn_id" {
  value = azurerm_virtual_network.vnet.id
}