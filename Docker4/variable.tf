variable "external_port" {
 type = list
 }
# validation {
#     condition = var.external_port == 1800
#     error_message = "The port must be 1800!!."
#     }
#}

# variable "count_of_conntainer" {
#     type = number
#     default = 3
# }

# variable "count_of_ramdom" {
#     type = number
#     default = 3
# }

locals {
    container_count = length(var.external_port) 
}