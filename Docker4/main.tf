
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.16.0"
    }
  }
}

provider "docker" {}

#attaching volume to docker container
resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir nodered_volume/ || true  && sudo chown -R 1000:1000 nodered_volume/"
    }
}


#pulling image form  dockerhub
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

#count is the number of container that will deploy using  the same image
resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", random_string.random-generator[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1884
    external = var.external_port[count.index]
  }
  volumes {
      container_path = "/data"
      host_path = "/home/ubuntu/environment/Docker4/nodered_volume"
  }
}

resource "random_string" "random-generator" {
  count = local.container_count
  length = 4
  special = false
  upper  = false
}