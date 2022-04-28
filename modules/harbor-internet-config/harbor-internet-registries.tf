#https://hub.docker.com

resource "harbor_registry" "dockerhub_mirror" {
  provider_name = "docker-registry"
  name          = "dockerhub.mirror"
  endpoint_url  = "registry.hub.docker.com"
}

resource "harbor_registry" "gitlab_registry" {
  provider_name = "docker-registry"
  name          = "gitlab.mirror"
  endpoint_url  = "https://registry.gitlab.com"
}

resource "harbor_registry" "jfrog_registry" {
  provider_name = "docker-registry"
  name          = "jfrog.mirror"
  endpoint_url  = "https://releases-docker.jfrog.io"
}

resource "harbor_registry" "ghcr_registry" {
  provider_name = "docker-registry"
  name          = "ghcr.mirror"
  endpoint_url  = "https://ghcr.io"
}
resource "harbor_registry" "quayio_registry" {
  provider_name = "docker-registry"
  name          = "quayio.mirror"
  endpoint_url  = "https://quay.io/repository"
}

resource "harbor_project" "dockerhub_mirror" {
  name        = "dockerhub"
  registry_id = harbor_registry.dockerhub_mirror.registry_id
  public = true
}

resource "harbor_project" "gitlab_mirror" {
  name        = "gitlab"
  registry_id = harbor_registry.gitlab_registry.registry_id
  public = true
}
resource "harbor_project" "jfrog_mirror" {
  name        = "jfrog"
  registry_id = harbor_registry.jfrog_registry.registry_id
  public = true
}
resource "harbor_project" "ghcr_mirror" {
  name        = "ghcr"
  registry_id = harbor_registry.ghcr_registry.registry_id
  public = true
}
resource "harbor_project" "quayio_mirror" {
  name        = "quayio"
  registry_id = harbor_registry.quayio_registry.registry_id
  public = true
}
