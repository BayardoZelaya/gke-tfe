output "role_name" {
  description = "Full resource name of the custom IAM role"
  value       = google_project_iam_custom_role.this.name
}

output "role_id" {
  description = "The role_id of the custom IAM role"
  value       = google_project_iam_custom_role.this.role_id
}
