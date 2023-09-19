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
  vpc_storage_id = dependency.network.outputs.vpc_storage_id
  vpc_storage_subnetwork = dependency.network.outputs.vpc_storage_subnetwork
}
