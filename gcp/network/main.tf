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
  ip_cidr_range = "10.1.0.0/24"
  network       = google_compute_network.back_office.self_link
  region        = var.region
}

# firewall rule for back office: iap
resource "google_compute_firewall" "back_office_iap" {
  name    = "back-office-iap"
  network = google_compute_network.back_office.self_link

  source_ranges = ["35.235.240.0/20"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
  }
}
# firelwall rule for back office: ssh
resource "google_compute_firewall" "back_office_ssh" {
  name    = "back-office-ssh"
  network = google_compute_network.back_office.self_link

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# firewall rule for back office: icmp
resource "google_compute_firewall" "back_office_icmp" {
  name    = "back-office-icmp"
  network = google_compute_network.back_office.self_link

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  allow {
    protocol = "icmp"
  }
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
  ip_cidr_range = "10.1.0.0/24"
  network       = google_compute_network.services.self_link
  region        = var.region
}

# firewall rule for services
resource "google_compute_firewall" "services_ssh" {
  name    = "services-ssh"
  network = google_compute_network.services.self_link

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
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

resource "google_compute_firewall" "services_iap" {
  name    = "services-iap"
  network = google_compute_network.services.self_link

  source_ranges = ["35.235.240.0/20"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
  }
}
