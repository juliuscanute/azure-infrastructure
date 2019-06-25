provider "azurerm" {
  version = "=1.28.0"
}

terraform {
  backend "azurerm" {}
}

data "terraform_remote_state" "init" {
  backend = "azurerm"
  config = {
    storage_account_name = "${var.storage_account_name}"
    container_name = "${var.container_name}"
    key = "${var.key}"
    access_key = "${var.access_key}"
  }
}
module "container" {
  source = "git@github.com:juliuscanute/azure-terraform-modules.git//container-registry?ref=0.0.10"
  registry_name = "${var.registry_name}"
  resource_group_name = "${data.terraform_remote_state.init.resource_group_name}"
  resouce_group_location = "${data.terraform_remote_state.init.resource_group_location}"
}

module "kubernetes" {
  source = "git@github.com:juliuscanute/azure-terraform-modules.git//kubernetes?ref=0.0.14"
  resource_group_name = "${data.terraform_remote_state.init.resource_group_name}"
  resouce_group_location = "${data.terraform_remote_state.init.resource_group_location}"
  kubernetes_cluster_name = "${var.kubernetes_cluster_name}"
  dns_prefix = "${var.dns_prefix}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  retention_in_days = 30
  analytics_sku = "PerGB2018"
}