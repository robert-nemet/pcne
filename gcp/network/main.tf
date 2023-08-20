# import default VPC
resource "google_compute_network" "default" {
  name                    = "default"
  description             = "Default network for the project"
  auto_create_subnetworks = true
  routing_mode            = "REGIONAL"
}

# vpc: back office
resource "google_compute_network" "back_office" {
  name                    = "back-office"
  description             = "Back office network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# subnet for back office
resource "google_compute_subnetwork" "back_office" {
  name          = "back-office"
  ip_cidr_range = "172.16.0.0/24"
  network       = google_compute_network.back_office.self_link
  region        = var.region
}

# vpc: services
resource "google_compute_network" "services" {
  name                    = "services"
  description             = "Services network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# subnet for services
resource "google_compute_subnetwork" "services" {
  name          = "services"
  ip_cidr_range = "172.16.0.0/24"
  network       = google_compute_network.services.self_link
  region        = var.region
}
