output "vpc_back_office" {
  value = google_compute_network.back_office.self_link
}

output "vpc_back_office_id" {
  value = google_compute_network.back_office.id
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
