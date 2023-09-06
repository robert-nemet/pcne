data "google_storage_project_service_account" "gcs_account" {
}

resource "google_kms_key_ring" "tf_states" {
  name     = "terraform-state-key-ring"
  location = "us"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key" "tf_states_key" {
  name            = "terraform-states-key"
  key_ring        = google_kms_key_ring.tf_states.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "binding" {
  crypto_key_id = google_kms_crypto_key.tf_states_key.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}

resource "google_storage_bucket" "tf_states_bucket" {
  name          = "terraform-states-${var.project_id}"
  force_destroy = false
  location      = "us"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = google_kms_crypto_key.tf_states_key.id
  }

  depends_on = [google_kms_crypto_key_iam_binding.binding]
  lifecycle {
    prevent_destroy = true
  }
}