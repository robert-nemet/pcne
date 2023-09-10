output "vpc_back_office" {
  value = google_compute_network.back_office
}

output "vpc_back_office_subnetwork" {
  value = google_compute_subnetwork.back_office
}

output "vpc_back_office_private_subnetwork" {
  value = google_compute_subnetwork.back_office_private
}

output "back_office_fw_sa" {
  value = google_service_account.back_office_fw_sa.email
}

output "vpc_services" {
  value = google_compute_network.services
}

output "vpc_services_subnetwork" {
  value = google_compute_subnetwork.services
}

output "vpc_storage" {
  value = google_compute_network.storage
}

output "vpc_storage_subnetwork" {
  value = google_compute_subnetwork.subnet_postgres
}

