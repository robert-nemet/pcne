# VM in services network
resource "google_compute_instance" "services_vm_test" {
  name         = "services-vm-test"
  machine_type = "f1-micro"
  zone         = var.zone

  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = data.terraform_remote_state.vpc_services.outputs.vpc_services_id
    subnetwork = data.terraform_remote_state.vpc_services.outputs.vpc_services_subnetwork.id
  }
}
