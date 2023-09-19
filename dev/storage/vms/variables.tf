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

variable "vpc_storage_id" {
  type = string
}

variable "vpc_storage_subnetwork" {
  type = any
}
