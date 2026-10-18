variable "rgs" {
  type = map(any)
}

# variable "virtual" {
#   type = map(any)
# }

variable "virtual" {
  type = map(object({
    name = string
    location = string
    rg_name = string
    address_space = list(string)
    subnet = optional(list(object({
      subnet_name = string
      address_prefixes = list(string)
    })))
  }))
}