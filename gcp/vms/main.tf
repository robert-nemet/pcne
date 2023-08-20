# VM in back office network
resource "google_compute_instance" "bo_vm_test" {
  name         = "bo-vm-test"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["bo-vm-test"]

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
    network    = data.terraform_remote_state.network.outputs.vpc_back_office.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_back_office_subnetwork.id
    access_config {}
  }
}

# VM in services network
resource "google_compute_instance" "services_vm_test" {
  name         = "services-vm-test"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["services-vm-test"]

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
    network    = data.terraform_remote_state.network.outputs.vpc_services.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_services_subnetwork.id
    access_config {}
  }
}

