resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = <<EOF
      rnemet:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfA2URsu2peoDwUzxj//yaJK1oUa/xjm8UKNeLXaun65BDnxB3cAdPtmLvIM89tc6Djy6QF80PLOUMHOv6M2JguyQQMItdcKy4ROWpZCiOmcmL00Q8sMFyJSGzy3OEUkTzP4v/FfsfHVDra9QaLxwOyW/vSpZrWv0AlN1KRtGRzaI67isEd4x/o+lkpz8+9zPWFSR3DiN2z3H732NeaAeFxnoakmNJF8khERSFP/V2EysZMoIY/UdnSDv2hUcZKB0M66CRk8Y6En8SsNy5C6ve2cIX815yxn6gz61lqRYtletOYLQgR35HcQqi/wJKAlMHRBqhbBWS/X7kxE6mzvaH rnemet
    EOF
  }
}

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
    email  = data.terraform_remote_state.back_office.outputs.back_office_fw_sa
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = data.terraform_remote_state.back_office.outputs.vpc_back_office_id
    subnetwork = data.terraform_remote_state.back_office.outputs.vpc_back_office_subnetwork.id
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
    network    = data.terraform_remote_state.back_office.outputs.vpc_back_office_id
    subnetwork = data.terraform_remote_state.back_office.outputs.vpc_back_office_subnetwork.id
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
    network    = data.terraform_remote_state.back_office.outputs.vpc_back_office_id
    subnetwork = data.terraform_remote_state.back_office.outputs.vpc_back_office_private_subnetwork.id
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
    network    = data.terraform_remote_state.back_office.outputs.vpc_back_office_id
    subnetwork = data.terraform_remote_state.back_office.outputs.vpc_back_office_private_subnetwork.id
  }
}
