module "storage-vm-1" {
  source       = "../../modules/vms"
  zone         = var.zone
  machine_type = "f1-micro"
  name         = "storage-vm-1"
  network      = data.terraform_remote_state.vpc_storage.outputs.vpc_storage_id
  subnetwork   = data.terraform_remote_state.vpc_storage.outputs.vpc_storage_subnetwork.id
}
