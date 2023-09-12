locals {
  peerings = {
    "back-office-services-peering" : {
      "network" : data.terraform_remote_state.back_office.outputs.vpc_back_office,
      "peer_network" : data.terraform_remote_state.services.outputs.vpc_services
    },
    "services-back-office-peering" : {
      "network" : data.terraform_remote_state.services.outputs.vpc_services,
      "peer_network" : data.terraform_remote_state.back_office.outputs.vpc_back_office,
    },
    "back-office-storage-peering" : {
      "network" : data.terraform_remote_state.back_office.outputs.vpc_back_office,
      "peer_network" : data.terraform_remote_state.storage.outputs.vpc_storage,
    },
    "storage-back-office-peering" : {
      "network" : data.terraform_remote_state.storage.outputs.vpc_storage,
      "peer_network" : data.terraform_remote_state.back_office.outputs.vpc_back_office,
    }
  }
}

resource "google_compute_network_peering" "peerings" {
  for_each = local.peerings

  name         = each.key
  network      = each.value.network
  peer_network = each.value.peer_network
}
