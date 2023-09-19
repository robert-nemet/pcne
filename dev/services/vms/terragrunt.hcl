include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../network"]
}

dependency "network" {
  config_path = "../network"
}

inputs = {
  vpc_services_id = dependency.network.outputs.vpc_services_id
  vpc_services_subnetwork = dependency.network.outputs.vpc_services_subnetwork
}
