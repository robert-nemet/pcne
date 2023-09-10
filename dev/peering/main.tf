resource "google_compute_network_peering" "back_office_service_peering" {
  name         = "back-office-services-peering"
  network      = data.terraform_remote_state.back_office.outputs.vpc_back_office
  peer_network = data.terraform_remote_state.services.outputs.vpc_services
}

resource "google_compute_network_peering" "service_back_office_peering" {
  name         = "services-back-office-peering"
  network      = data.terraform_remote_state.services.outputs.vpc_services
  peer_network = data.terraform_remote_state.back_office.outputs.vpc_back_office
}

resource "google_compute_network_peering" "back_office_datastorage_peering" {
  name         = "back-office-storage-peering"
  network      = data.terraform_remote_state.back_office.outputs.vpc_back_office
  peer_network = data.terraform_remote_state.storage.outputs.vpc_storage
}

resource "google_compute_network_peering" "datastorage_back_office_peering" {
  name         = "storage-back-office-peering"
  network      = data.terraform_remote_state.storage.outputs.vpc_storage
  peer_network = data.terraform_remote_state.back_office.outputs.vpc_back_office
}

