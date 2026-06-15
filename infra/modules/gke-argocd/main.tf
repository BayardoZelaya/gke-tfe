resource "kubernetes_namespace_v1" "argocd" {

  metadata {
    name = var.namespace
    labels = {
      "managed-by" = "terraform"
    }
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_chart_version
  namespace  = kubernetes_namespace_v1.argocd.metadata[0].name

  timeout         = 600
  wait            = true
  cleanup_on_fail = true

  values = [
    yamlencode(var.argocd_values)
  ]
}
