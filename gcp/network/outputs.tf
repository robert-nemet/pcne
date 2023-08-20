output "vpc_back_office" {
  value = google_compute_network.back_office
}

output "vpc_back_office_subnetwork" {
  value = google_compute_subnetwork.back_office
}

output "vpc_services" {
  value = google_compute_network.services
}

output "vpc_services_subnetwork" {
  value = google_compute_subnetwork.services
}
