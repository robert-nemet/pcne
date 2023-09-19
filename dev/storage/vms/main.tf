module "storage-vm-1" {
  source       = "../../../modules/vms"
  zone         = var.zone
  machine_type = "f1-micro"
  name         = "storage-vm-1"
  network      = var.vpc_storage_id
  subnetwork   = var.vpc_storage_subnetwork.id
}
