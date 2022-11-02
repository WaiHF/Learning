terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  # image = docker_image.nginx.latest does not seem to be needed anymore.
  image = docker_image.nginx
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
