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
