variable "zone" {
  description = "default zone"
  type        = string
}

variable "machine_type" {
  description = "default machine type"
  type        = string
}

variable "name" {
  description = "default name"
  type        = string
}

variable "network" {
  description = "default network"
  type        = string
}

variable "subnetwork" {
  description = "default subnetwork"
  type        = string
}

variable "sa_email" {
  description = "default service account email"
  type        = string
  default     = ""
}

variable "allow_stopping_for_update" {
  description = "default allow_stopping_for_update"
  type        = bool
  default     = false
}
