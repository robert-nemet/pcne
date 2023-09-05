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
  ip_cidr_range = "10.3.0.0/24"
  network       = google_compute_network.services.self_link
  region        = var.region
}

resource "google_compute_firewall" "services_icmp" {
  name    = "services-icmp"
  network = google_compute_network.services.self_link

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  allow {
    protocol = "icmp"
  }
}

# firewall rule for services: ssh
resource "google_compute_firewall" "services_ssh" {
  name    = "services-ssh"
  network = google_compute_network.services.self_link

  source_ranges = ["10.1.0.0/24", "10.2.0.0/24"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# # firewall rule for services : iap
# resource "google_compute_firewall" "services_iap" {
#   name    = "services-iap"
#   network = google_compute_network.services.self_link

#   source_ranges = ["35.235.240.0/20"]
#   direction     = "INGRESS"
#   allow {
#     protocol = "tcp"
#   }
# }
