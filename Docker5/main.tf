
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
  name = lookup(var.image, terraform.workspace)
}

#count is the number of container that will deploy using  the same image
resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random-generator[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1884
    external = lookup(var.external_port, terraform.workspace)[count.index]
  }
  volumes {
      container_path = "/data"
      host_path = "${path.cwd}/nodered_volume"
  }
}

resource "random_string" "random-generator" {
  count = local.container_count
  length = 4
  special = false
  upper  = false
}