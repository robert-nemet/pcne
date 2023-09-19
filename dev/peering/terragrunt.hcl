include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../back-office/network", "../services/network", "../storage/network"]
}

dependency "back-office" {
  config_path = "../back-office/network"
}

dependency "services" {
  config_path = "../services/network"
}

dependency "storage" {
  config_path = "../storage/network"
}

inputs = {
  vpc_back_office = dependency.back-office.outputs.vpc_back_office
  vpc_services = dependency.services.outputs.vpc_services
  vpc_storage = dependency.storage.outputs.vpc_storage
}