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

# subnet for back office: private 
resource "google_compute_subnetwork" "back_office_private" {
  name          = "back-office-private"
  ip_cidr_range = "10.2.0.0/24"
  network       = google_compute_network.back_office.self_link
  region        = var.region
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

# service account for back office
resource "google_service_account" "back_office_fw_sa" {
  account_id   = "back-office"
  display_name = "back-office"
}


# firewall rule for back office: iap
resource "google_compute_firewall" "back_office_iap" {
  name    = "back-office-iap"
  network = google_compute_network.back_office.self_link

  source_ranges           = ["35.235.240.0/20"]
  target_service_accounts = [google_service_account.back_office_fw_sa.email]
  direction               = "INGRESS"
  allow {
    protocol = "tcp"
  }
  depends_on = [google_service_account.back_office_fw_sa]
}

# resource "google_compute_firewall" "back_office_internet" {
#   name    = "back-office-internet"
#   network = google_compute_network.back_office.self_link

#   destination_ranges = ["0.0.0.0/0"]
#   direction          = "EGRESS"
#   allow {
#     protocol = "all"
#   }
# }

