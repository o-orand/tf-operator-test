provider "harbor" {
  url      = format("https://%s.%s",var.harbor_internet_hostname,var.ops_domain)
  username = var.harbor_internet_username
  password = var.harbor_internet_password
}

variable "harbor_internet_hostname" {
  type        = string
  description = "Harbor internet hostname"
  default = "harbor-internet-core"
}

variable "harbor_internet_username" {
  type        = string
  description = "Harbor admin username"
}

variable "harbor_internet_password" {
  type        = string
  description = "Harbor admin password"
  sensitive = true
}

variable "ops_domain" {
  type        = string
  description = "Paas Templates OPS domain"
}
