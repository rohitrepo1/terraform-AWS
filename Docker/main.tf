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

resource "docker_container" "nodered_container" {
  name  = join("-", ["nodered", random_string.random-generator.result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1880
    external = 1800
  }
}


resource "docker_container" "nodered2" {
  name  = join("-", ["nodered2", random_string.random-generator2.result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1880
    #external = 1800
  }
}

resource "random_string" "random-generator" {
  length = 4
  special = false
  upper  = false
}
resource "random_string" "random-generator2" {
  length = 4
  special = false
  upper  = false
}


#ip of the container
output "IP_Address" {
  value = docker_container.nodered_container.ip_address
  description = "The IP of the Container"
}
#container name that is deployed
output "container_Name" {
  value = docker_container.nodered_container.name
  description = "The name of the Container"
}

#find  the IP and  the port exposed for the image(joining the output in single output)
output "ip_address_port" {
  value = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "the Name ip and the port of the container"
}

output "ip_address_port_2" {
  value = join(":",[docker_container.nodered2.ip_address, docker_container.nodered2.ports[0].external])
  description = "Node and IP details"
}