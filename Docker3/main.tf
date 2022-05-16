
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.16.0"
    }
  }
}

provider "docker" {}


#pulling image form  dockerhub
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

#count is the number of container that will deploy using  the same image
resource "docker_container" "nodered_container" {
  count = var.count_of_conntainer
  name  = join("-", ["nodered", random_string.random-generator[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1880
    external = var.external_port
  }
}

resource "random_string" "random-generator" {
  count = var.count_of_ramdom
  length = 4
  special = false
  upper  = false
}