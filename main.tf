module "vpc" {
  source     = "./infra/modules/vpc"
  project_id = var.gcp_project_name
  region     = var.gcp_region
  subnets    = var.subnets
}

module "gke" {
  source = "./infra/modules/gke"

  depends_on = [module.vpc]

  project_id = var.gcp_project_name
  region     = var.gcp_region

  vpc_name    = module.vpc.network_name
  subnet_name = module.vpc.subnet_names["platform"]

  node_pools = var.node_pools
}

module "argocd" {
  source = "./infra/modules/gke-argocd"

  depends_on = [module.gke]

  argocd_chart_version = var.argocd_chart_version

  argocd_values = {
    server = {
      service = {
        type = "ClusterIP"
      }
    }
  }
}
