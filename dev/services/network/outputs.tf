output "vpc_services" {
  value = google_compute_network.services
}

output "vpc_services_subnetwork" {
  value = google_compute_subnetwork.services
}
