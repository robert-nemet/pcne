output "vpc_storage" {
  value = module.storage.network_self_link
}

output "vpc_storage_id" {
  value = module.storage.network_id
}

output "vpc_storage_subnetwork" {
  value = module.storage.subnets["us-central1/postgres"]
}

