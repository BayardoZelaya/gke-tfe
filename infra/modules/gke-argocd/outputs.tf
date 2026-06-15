output "namespace" {
  value = kubernetes_namespace_v1.argocd.metadata[0].name
}

output "argocd_server_service" {
  value = "argocd-server.${var.namespace}.svc.cluster.local"
}
