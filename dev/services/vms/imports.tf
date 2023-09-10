data "terraform_remote_state" "vpc_services" {
  backend = "gcs"

  config = {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state/dev/services/network"
  }
}
