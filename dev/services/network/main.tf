module "services" {
  source  = "terraform-google-modules/network/google"
  version = "~> 7.3"

  project_id   = var.project_id
  network_name = "services"
  routing_mode = "REGIONAL"

  description = "Services network"

  subnets = [
    {
      subnet_name   = "services"
      subnet_ip     = "10.3.0.0/24"
      subnet_region = var.region
    }
  ]

  ingress_rules = [
    {
      name = "services-icmp"
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
      name = "services-ssh"
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
