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

