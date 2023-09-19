module "storage" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.3"

  project_id   = var.project_id
  network_name = "storage"
  routing_mode = "REGIONAL"

  description = "Storage network"

  subnets = [
    {
      subnet_name   = "postgres"
      subnet_ip     = "10.120.0.0/24"
      subnet_region = var.region
    }
  ]

  ingress_rules = [
    {
      name = "storage-icmp"
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
      name = "storage-ssh"
      allow = [
        {
          protocol = "tcp"
          ports    = ["22"]
        }
      ]
      source_ranges = [
        "10.1.0.0/24",
        "10.2.0.0/24"
      ]
    }
  ]
}
