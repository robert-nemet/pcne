variable "project_id" {
  description = "project id"
  type        = string
}

variable "region" {
  description = "default region"
  type        = string
}

variable "zone" {
  description = "default zone"
  type        = string
}

variable "back_office_fw_sa" {
  description = "back office firewall service account"
  type        = string
}

variable "vpc_back_office_id" {
  description = "back office vpc id"
  type        = string
}

variable "vpc_back_office_subnetwork" {
  description = "back office vpc subnetwork"
  type        = any
}
