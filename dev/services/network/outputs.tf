output "vpc_services" {
  value = google_compute_network.services.self_link
}

output "vpc_services_subnetwork" {
  value = google_compute_subnetwork.services
}
