data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state/network"
  }
}
