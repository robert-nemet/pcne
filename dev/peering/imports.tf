data "terraform_remote_state" "back_office" {
  backend = "gcs"

  config = {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state/dev/back-office/network"
  }
}

data "terraform_remote_state" "services" {
  backend = "gcs"

  config = {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state/dev/services/network"
  }
}

data "terraform_remote_state" "storage" {
  backend = "gcs"

  config = {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state/dev/storage/network"
  }
}
