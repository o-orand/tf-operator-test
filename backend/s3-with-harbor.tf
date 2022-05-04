terraform {
  backend "s3" {
    bucket = "terraform"
    key    = "micro-depls/00-core-connectivity-k8s/10-harbor-registry-intranet/terraform.tfstate"
    force_path_style = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
  }

  required_providers {
    harbor = {
      source = "BESTSELLER/harbor"
      version = "3.5.0"
    }
  }
}
