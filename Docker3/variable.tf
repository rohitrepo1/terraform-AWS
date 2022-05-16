variable "external_port" {
 type = number
 sensitive = true
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