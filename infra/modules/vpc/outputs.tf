output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.vpc.name
}

output "network_self_link" {
  description = "The self_link of the subnet"
  value       = google_compute_network.vpc.self_link
}

# output "subnet_name" {
#   description = "The name of the subnet"
#   value       = google_compute_subnetwork.subnet.name
# }

# output "subnet_self_link" {
#   description = "The self_link of the subnet"
#   value       = google_compute_subnetwork.subnet.self_link
# }

# output "subnet_cidr_range" {
#   description = "The primary CIDR range of the subnet"
#   value       = google_compute_subnetwork.subnet.ip_cidr_range
# }

output "subnet_names" {
  description = "Map of subnet key to subnet name"
  value       = { for k, v in google_compute_subnetwork.this : k => v.name }
}

output "subnet_self_links" {
  description = "map of subnet self_links"
  value       = { for k, v in google_compute_subnetwork.this : k => v.self_link }

}
