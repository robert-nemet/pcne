# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

terraform {
  required_version = ">=1.5.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.77.0"
    }
  }
}
