variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

# variable "subnet_cidr_range" {
#   description = "cidr range for subnet"
# }


variable "subnets" {
  description = "Map of subnet configs"

  type = map(object({
    cidr             = string
    region           = string
    secondary_ranges = optional(map(string), {})
  }))

}

