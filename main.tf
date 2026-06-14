module "github_actions_iam" {
  source = "./infra/modules/iam"

  project_id       = var.gcp_project_name
  role_id          = "terraformRunner"
  role_title       = "Terraform Runner"
  role_description = "Least-privilege role for GitHub Actions Terraform runs (GKE + VPC)"

  permissions = [
    # GKE — data source + cluster + node pool lifecycle
    "container.clusters.create",
    "container.clusters.delete",
    "container.clusters.get",
    "container.clusters.list",
    "container.clusters.update",
    "container.nodePools.create",
    "container.nodePools.delete",
    "container.nodePools.get",
    "container.nodePools.list",
    "container.nodePools.update",
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
    "resourcemanager.projects.list",
  ]

  members = [
    "serviceAccount:github-actions-sa@${var.gcp_project_name}.iam.gserviceaccount.com",
  ]

  # Grant actAs scoped to the GKE node SA only
  sa_user_bindings = {
    "serviceAccount:github-actions-sa@${var.gcp_project_name}.iam.gserviceaccount.com" = "${var.gcp_project_name}-compute@developer.gserviceaccount.com"
  }
}

module "vpc" {
  source            = "./infra/modules/vpc"
  project_id        = var.gcp_project_name
  region            = var.gcp_region
  subnet_cidr_range = var.vpc_subnet_cidr_range
}

module "gke" {
  source = "./infra/modules/gke"

  project_id = var.gcp_project_name
  region     = var.gcp_region

  vpc_name    = module.vpc.network_name
  subnet_name = module.vpc.subnet_name

  gke_num_nodes = var.node_count

}
