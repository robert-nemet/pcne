output "vpc_storage" {
  value = google_compute_network.storage
}

output "vpc_storage_subnetwork" {
  value = google_compute_subnetwork.subnet_postgres
}

