output "container_ip_port_is_" {
    value = [for i in docker_container.nodered_container[*]: join(":",[i.ip_address], i.ports[*]["external"])]
    description = "the IP and the port"
}