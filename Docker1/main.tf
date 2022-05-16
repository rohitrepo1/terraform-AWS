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
  count = 2
  name  = join("-", ["nodered", random_string.random-generator[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal  = 1880
    #external = 1800
  }
}

resource "random_string" "random-generator" {
  count = 2 
  length = 4
  special = false
  upper  = false
}

output "container_ip_port_is_" {
    value = [for i in docker_container.nodered_container[*]: join(":",[i.ip_address], i.ports[*]["external"])]
    description = "the IP and the port"
}

# output "container_ip_port_is" {
#     value = join(":", [docker_container.nodered_container[0].ip_address, docker_container.nodered_container[0].ports[0].external])
#     description = "the IP and the port"
# }  

# removing  duplicate  in the output 
