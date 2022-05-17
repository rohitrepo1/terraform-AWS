variable "image" {
    type = map
    default = {
        Dev = "nodered/node-red:latest"
        Prod = "nodered/node-red:latest-minimal"
    }
}

variable "external_port" {
 type = map
 
validation {
    condition = max(var.external_port["Dev"]...) <= 65535 && min(var.external_port["Dev"]...) >= 1900
    error_message = "The port must be 1800!!" 
   }

validation {
    condition = max(var.external_port["Prod"]...) <= 1980 && min(var.external_port["Prod"]...) >= 1880
    error_message = "The port must be 1800!!" 
   }
}

# variable "count_of_conntainer" {
#     type = number
#     default = 3
# }

# variable "count_of_ramdom" {
#     type = number
#     default = 3
# }

locals {
    container_count = length(lookup(var.external_port, terraform.workspace))
}
