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
  vpc_back_office_id = dependency.network.outputs.vpc_back_office_id
  vpc_back_office_subnetwork = dependency.network.outputs.vpc_back_office_subnetwork
  back_office_fw_sa = dependency.network.outputs.back_office_fw_sa
}
