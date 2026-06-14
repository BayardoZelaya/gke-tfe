variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "role_id" {
  description = "Unique ID for the custom IAM role (e.g. terraformRunner)"
  type        = string
}

variable "role_title" {
  description = "Human-readable title for the custom IAM role"
  type        = string
}

variable "role_description" {
  description = "Description for the custom IAM role"
  type        = string
  default     = ""
}

variable "permissions" {
  description = "List of IAM permissions to grant to the custom role"
  type        = list(string)
}

variable "members" {
  description = "List of IAM members to bind to the custom role (e.g. serviceAccount:foo@project.iam.gserviceaccount.com)"
  type        = list(string)
}

variable "sa_user_bindings" {
  description = "Map of service account emails to grant roles/iam.serviceAccountUser to the members list (scoped actAs)"
  type        = map(string)
  default     = {}
}
