resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_name
  subnetwork = var.subnet_name

  deletion_protection = false

  node_config {
    machine_type = "e2-medium"
    disk_type    = "pd-standard"
    disk_size_gb = 50
  }

}

resource "google_container_node_pool" "pools" {
  for_each = local.node_pool_map

  name = each.key

  location = var.region

  cluster = google_container_cluster.primary.name

  version    = data.google_container_engine_versions.gke_version.release_channel_default_version["STABLE"]
  node_count = each.value.node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = merge({ env = var.project_id }, each.value.labels)

    machine_type = each.value.machine_type
    disk_type    = each.value.disk_type
    disk_size_gb = each.value.disk_size_gb
    tags         = ["gke-node", "${var.project_id}-gke"]


    dynamic "taint" {
      for_each = each.value.taints
      content {
        key    = taint.value.key
        value  = taint.value.value
        effect = taint.value.effect
      }

    }
  }
}
