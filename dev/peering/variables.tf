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

variable "vpc_back_office" {
  type = string
}

variable "vpc_services" {
  type = string
}

variable "vpc_storage" {
  type = string
}
