provider "google" {
  credentials = file(var.gcp_application_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
  alias       = "default"
}