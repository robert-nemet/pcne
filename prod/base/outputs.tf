output "gcs_account_email" {
  value = data.google_storage_project_service_account.gcs_account.email_address
}

output "region" {
  value = var.region
}

output "zone" {
  value = var.zone
}

output "project_id" {
  value = var.project_id
}
