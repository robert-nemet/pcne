# vpc: storage
resource "google_compute_network" "storage" {
  name                    = "storage"
  description             = "Storage network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# subnet for storage
resource "google_compute_subnetwork" "subnet_postgres" {
  name          = "postgres"
  ip_cidr_range = "10.120.0.0/24"
  network       = google_compute_network.storage.self_link
  region        = var.region
}

# firewall rule for storage: icmp
resource "google_compute_firewall" "storage_icmp" {
  name    = "storage-icmp"
  network = google_compute_network.storage.self_link

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  allow {
    protocol = "icmp"
  }
}

# firewall rule for storage: ssh
resource "google_compute_firewall" "storage_ssh" {
  name    = "storage-ssh"
  network = google_compute_network.storage.self_link

  source_ranges = ["10.1.0.0/24", "10.2.0.0/24"]
  direction     = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
