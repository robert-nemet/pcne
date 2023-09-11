module "back-office" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.3"

  project_id   = var.project_id
  network_name = "back-office"
  routing_mode = "REGIONAL"

  description = "Back office network"

  subnets = [
    {
      subnet_name   = "back-office"
      subnet_ip     = "10.1.0.0/24"
      subnet_region = var.region
    },
    {
      subnet_name   = "back-office-private"
      subnet_ip     = "10.2.0.0/24"
      subnet_region = var.region
    }
  ]

  ingress_rules = [
    {
      name = "back-office-icmp"
      allow = [
        {
          protocol = "icmp"
        }
      ]
      source_ranges = [
        "0.0.0.0/0"
      ]
    },
    {
      name = "back-office-iap"
      allow = [
        {
          protocol = "tcp"
        }
      ]
      source_ranges = [
        "35.235.240.0/20"
      ]
      target_service_accounts = [google_service_account.back_office_fw_sa.email]
      allow = [
        {
          protocol = "tcp"
        }
      ]

      depends_on = [google_service_account.back_office_fw_sa]
    }
  ]
}

# service account for back office
resource "google_service_account" "back_office_fw_sa" {
  account_id   = "back-office"
  display_name = "back-office"
}
