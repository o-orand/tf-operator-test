terraform {
  required_providers {
    harbor = {
      source = "BESTSELLER/harbor"
      version = "3.5.0"
    }
  }
}

provider "harbor" {
  url      = format("https://%s.%s",var.harbor_intranet_hostname,var.ops_domain)
  username = var.harbor_intranet_username
  password = var.harbor_intranet_password
}

variable "harbor_intranet_hostname" {
  type        = string
  description = "Harbor intranet hostname"
  default = "harbor-intra-core"
}

variable "harbor_intranet_username" {
  type        = string
  description = "Harbor intranet username"
}

variable "harbor_intranet_password" {
  type        = string
  description = "Harbor intranet password"
  sensitive = true
}

variable "ops_domain" {
  type        = string
  description = "Paas Templates OPS domain"
}
