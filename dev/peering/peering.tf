resource "google_compute_network_peering" "back_office_service_peering" {
  name         = "back-office-services-peering"
  network      = google_compute_network.back_office.self_link
  peer_network = google_compute_network.services.self_link
}

resource "google_compute_network_peering" "service_back_office_peering" {
  name         = "services-back-office-peering"
  network      = google_compute_network.services.self_link
  peer_network = google_compute_network.back_office.self_link
}

resource "google_compute_network_peering" "back_office_datastorage_peering" {
  name         = "back-office-storage-peering"
  network      = google_compute_network.back_office.self_link
  peer_network = google_compute_network.storage.self_link
}

resource "google_compute_network_peering" "datastorage_back_office_peering" {
  name         = "storage-back-office-peering"
  network      = google_compute_network.storage.self_link
  peer_network = google_compute_network.back_office.self_link
}
