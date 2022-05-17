terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "grafana" {
  name = "grafana:latest"
}

resource "docker_container" "grafana" {
    image = docker_image.grafana.latest
    name = "test"
}