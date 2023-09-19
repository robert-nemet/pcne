module "services_vm_test" {
  source       = "../../../modules/vms"
  zone         = var.zone
  machine_type = "f1-micro"
  name         = "services-vm-test"
  network      = var.vpc_services_id
  subnetwork   = var.vpc_services_subnetwork.id
}
