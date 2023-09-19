# VM in back office network, subnet back-office
resource "google_compute_instance" "back_office_vm1" {
  name         = "back-office-vm1"
  machine_type = "f1-micro"
  zone         = var.zone

  scheduling {
    preemptible        = true
    automatic_restart  = false
    provisioning_model = "SPOT"
  }

  allow_stopping_for_update = true

  service_account {
    email  = data.terraform_remote_state.network.outputs.back_office_fw_sa
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = data.terraform_remote_state.network.outputs.vpc_back_office.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_back_office_subnetwork.id
  }
}

resource "google_compute_instance" "back_office_vm2" {
  name         = "back-office-vm2"
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
    network    = data.terraform_remote_state.network.outputs.vpc_back_office.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_back_office_subnetwork.id
  }
}

# VM in back office network, subnet back-office-private
resource "google_compute_instance" "back_office_private_vm1" {
  name         = "back-office-private-vm1"
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
    network    = data.terraform_remote_state.network.outputs.vpc_back_office.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_back_office_private_subnetwork.id
  }
}

resource "google_compute_instance" "back_office_private_vm2" {
  name         = "back-office-private-vm2"
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
    network    = data.terraform_remote_state.network.outputs.vpc_back_office.id
    subnetwork = data.terraform_remote_state.network.outputs.vpc_back_office_private_subnetwork.id
  }
}
