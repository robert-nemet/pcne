output "vpc_back_office" {
  value = module.back-office.network_self_link
}

output "vpc_back_office_id" {
  value = module.back-office.network_id
}

output "vpc_back_office_subnetwork" {
  value = module.back-office.subnets["us-central1/back-office"]
}

output "vpc_back_office_private_subnetwork" {
  value = module.back-office.subnets["us-central1/back-office-private"]
}

output "back_office_fw_sa" {
  value = google_service_account.back_office_fw_sa.email
}
