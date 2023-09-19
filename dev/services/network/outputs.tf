output "vpc_services" {
  value = module.services.network_self_link
}

output "vpc_services_id" {
  value = module.services.network_id
}


output "vpc_services_subnetwork" {
  value = module.services.subnets["us-central1/services"]
}
