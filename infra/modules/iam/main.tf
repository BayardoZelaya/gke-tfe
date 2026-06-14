resource "google_project_iam_custom_role" "this" {
  project     = var.project_id
  role_id     = var.role_id
  title       = var.role_title
  description = var.role_description
  permissions = var.permissions
}

resource "google_project_iam_member" "this" {
  for_each = toset(var.members)

  project = var.project_id
  role    = google_project_iam_custom_role.this.name
  member  = each.value
}

resource "google_service_account_iam_member" "sa_user" {
  for_each = var.sa_user_bindings

  service_account_id = "projects/${var.project_id}/serviceAccounts/${each.value}"
  role               = "roles/iam.serviceAccountUser"
  member             = each.key
}
