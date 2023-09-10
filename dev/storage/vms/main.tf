resource "google_compute_instance" "storage_vm_1" {
  name         = "storage-vm-1"
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
    network    = data.terraform_remote_state.vpc_storage.outputs.vpc_storage_id
    subnetwork = data.terraform_remote_state.vpc_storage.outputs.vpc_storage_subnetwork.id
  }
}
