module "github_actions_iam" {
  source = "../infra/modules/iam"

  project_id       = var.project_id
  role_id          = "terraformRunner"
  role_title       = "Terraform Runner"
  role_description = "Least-privilege role for GitHub Actions Terraform runs (GKE + VPC)"

  permissions = [
    # GKE — data source + cluster + node pool lifecycle
    # Note: node pool CRUD is gated by container.clusters.update, not separate nodePools.* permissions
    "container.clusters.create",
    "container.clusters.delete",
    "container.clusters.get",
    "container.clusters.list",
    "container.clusters.update",
    "container.operations.get",
    "container.operations.list",

    # Compute — VPC network + subnetwork lifecycle
    "compute.networks.create",
    "compute.networks.delete",
    "compute.networks.get",
    "compute.networks.list",
    "compute.networks.update",
    "compute.networks.updatePolicy",
    "compute.subnetworks.create",
    "compute.subnetworks.delete",
    "compute.subnetworks.get",
    "compute.subnetworks.list",
    "compute.subnetworks.update",
    "compute.subnetworks.use",

    # Required by GKE and Terraform providers to read project metadata
    "resourcemanager.projects.get",
  ]

  members = [
    "serviceAccount:github-actions-sa@${var.project_id}.iam.gserviceaccount.com",
  ]

  extra_roles = [
    "roles/compute.viewer",
  ]

  sa_user_bindings = {
    "serviceAccount:github-actions-sa@${var.project_id}.iam.gserviceaccount.com" = "171986717256-compute@developer.gserviceaccount.com"
  }
}
