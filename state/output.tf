output "storage_key" {
  value = "${module.storage.storage_access_key}"
}

output "storage_id" {
  value = "${module.storage.storage_id}"
}

output "resource_group_name" {
  value = "${var.resource_group_name}"
}
output "resource_group_location" {
  value = "${var.location}"
}

output "storage_account_name" {
  value = "${var.storage_account_name}"
}

output "container_name" {
  value = "${var.container_name}"
}