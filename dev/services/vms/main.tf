module "services_vm_test" {
  source       = "../../../modules/vms"
  zone         = var.zone
  machine_type = "f1-micro"
  name         = "services-vm-test"
  network      = data.terraform_remote_state.vpc_services.outputs.vpc_services_id
  subnetwork   = data.terraform_remote_state.vpc_services.outputs.vpc_services_subnetwork.id
}
