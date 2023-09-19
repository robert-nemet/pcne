locals {
  peerings = {
    "back-office-services-peering" : {
      "network" : var.vpc_back_office,
      "peer_network" : var.vpc_services
    },
    "services-back-office-peering" : {
      "network" : var.vpc_services,
      "peer_network" : var.vpc_back_office,
    },
    "back-office-storage-peering" : {
      "network" : var.vpc_back_office,
      "peer_network" : var.vpc_storage,
    },
    "storage-back-office-peering" : {
      "network" : var.vpc_storage,
      "peer_network" : var.vpc_back_office,
    }
  }
}

resource "google_compute_network_peering" "peerings" {
  for_each = local.peerings

  name         = each.key
  network      = each.value.network
  peer_network = each.value.peer_network
}
