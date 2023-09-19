generate "provider" {
    path = "provider.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
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
EOF
}

remote_state {
    backend = "gcs"
    generate = {
        path = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        bucket = "terraform-states-network-playground-382512"
        prefix = "terraform/state/dev/${path_relative_to_include()}"
    }
}

terraform {
    extra_arguments "common" {
        commands = get_terraform_commands_that_need_vars()

        arguments = [
            "-var-file=${path_relative_from_include()}/common.tfvars",
        ]
    }
}