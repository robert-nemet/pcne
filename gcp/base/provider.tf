provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


terraform {
  required_version = ">=1.5.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.77.0"
    }
  }

  backend "gcs" {
    bucket = "terraform-states-network-playground-382512"
    prefix = "terraform/state"
  }
}
