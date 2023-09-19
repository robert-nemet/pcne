resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = <<EOF
      rnemet:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfA2URsu2peoDwUzxj//yaJK1oUa/xjm8UKNeLXaun65BDnxB3cAdPtmLvIM89tc6Djy6QF80PLOUMHOv6M2JguyQQMItdcKy4ROWpZCiOmcmL00Q8sMFyJSGzy3OEUkTzP4v/FfsfHVDra9QaLxwOyW/vSpZrWv0AlN1KRtGRzaI67isEd4x/o+lkpz8+9zPWFSR3DiN2z3H732NeaAeFxnoakmNJF8khERSFP/V2EysZMoIY/UdnSDv2hUcZKB0M66CRk8Y6En8SsNy5C6ve2cIX815yxn6gz61lqRYtletOYLQgR35HcQqi/wJKAlMHRBqhbBWS/X7kxE6mzvaH rnemet
    EOF
  }
}

module "vms" {
  for_each = toset(["back-office-vm2", "back-office-private-vm1", "back-office-private-vm2", "back-office-vm1"])

  source       = "../../../modules/vms"
  zone         = var.zone
  machine_type = "f1-micro"
  name         = each.value
  network      = var.vpc_back_office_id
  subnetwork   = var.vpc_back_office_subnetwork.id

  sa_email                  = "back-office-vm1" == each.value ? var.back_office_fw_sa : ""
  allow_stopping_for_update = "back-office-vm1" == each.value ? true : false
}
