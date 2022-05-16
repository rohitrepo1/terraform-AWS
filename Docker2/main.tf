terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.16.0"
    }
  }
}

provider "docker" {}

variable "external_port" {
 type = number
 default = 1800
    
validation {
    condition = var.external_port == 1800
    error_message = "The port must be 1800!!."
    }
}

variable "count_of_conntainer" {
    type = number
    default = 1
}

variable "count_of_ramdom" {
    type = number
    default = 2
}

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

output "container_ip_port_is_" {
    value = [for i in docker_container.nodered_container[*]: join(":",[i.ip_address], i.ports[*]["external"])]
    description = "the IP and the port"
}


