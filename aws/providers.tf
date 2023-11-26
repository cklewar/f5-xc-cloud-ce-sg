provider "volterra" {
  api_p12_file = format("%s/%s", var.root_path, var.f5xc_api_p12_file_absolute)
  url          = var.f5xc_api_url
  alias        = "default"
}

provider "aws" {
  region = var.f5xc_aws_region
  alias  = "default"
}