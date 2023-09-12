resource "google_compute_instance" "virtual_machine" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "STOP"
  }

  allow_stopping_for_update = var.allow_stopping_for_update

  dynamic "service_account" {

    for_each = var.sa_email != "" ? [var.sa_email] : []

    content {
      email  = service_account.value
      scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    }
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }
}
