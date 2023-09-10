output "vpc_storage" {
  value = google_compute_network.storage.self_link
}

output "vpc_storage_subnetwork" {
  value = google_compute_subnetwork.subnet_postgres
}

