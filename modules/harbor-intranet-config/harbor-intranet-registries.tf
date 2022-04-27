resource "harbor_registry" "harbor_internet" {
  provider_name = "harbor"
  name          = "internet"
  endpoint_url  = format("https://%s.%s",var.harbor_internet_hostname,var.ops_domain)
}

resource "harbor_registry" "dockerhub_mirror" {
  provider_name = "docker-registry"
  name          = "dockerhub"
  endpoint_url  = var.dockerhub_mirror_url
}

resource "harbor_registry" "quayio_mirror" {
  provider_name = "docker-registry"
  name          = "quayio"
  endpoint_url  = var.quayio_mirror_url
}

resource "harbor_registry" "jcr_mirror" {
  provider_name = "docker-registry"
  name          = "jcr"
  endpoint_url  = format("https://%s.%s",var.docker_jcr_hostname,var.ops_domain)
}

resource "harbor_project" "harbor_internet" {
  name        = "internet"
  registry_id = harbor_registry.harbor_internet.registry_id
  public = true
}

resource "harbor_project" "dockerhub_mirror" {
  name        = "dockerhub"
  registry_id = harbor_registry.dockerhub_mirror.registry_id
  public = true
}

resource "harbor_project" "quayio_mirror" {
  name        = "quayio"
  registry_id = harbor_registry.quayio_mirror.registry_id
  public = true
}

resource "harbor_project" "jcr_mirror" {
  name        = "jcr"
  registry_id = harbor_registry.jcr_mirror.registry_id
  public = true
}


variable "harbor_internet_hostname" {
  type        = string
  description = "Harbor internet hostname"
  default = "harbor-core"
}

variable "dockerhub_mirror_url" {
  type        = string
  description = "Docker Hub mirror url"
}

variable "quayio_mirror_url" {
  type        = string
  description = "Quay.io mirror url"
}

variable "docker_jcr_hostname" {
  type        = string
  description = "Paas templates JCR hostname"
  default = "docker.jcr-k8s"
}
