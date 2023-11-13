provider "google" {
  credentials = file(var.gcp_application_credentials)
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_zone
  alias       = "default"
}

provider "volterra" {
  api_p12_file = format("%s/%s", var.root_path, var.f5xc_api_p12_file_absolute)
  url          = var.f5xc_api_url
  alias        = "default"
}

