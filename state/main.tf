provider "azurerm" {
  version = "=1.28.0"
}

terraform {
  backend "azurerm" {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

module storage {
  source = "git@github.com:juliuscanute/azure-terraform-modules.git//storage?ref=0.0.7"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  location="${azurerm_resource_group.resource_group.location}"
  storage_account_name="${var.storage_account_name}"
  storage_container_name="${var.container_name}"
}


