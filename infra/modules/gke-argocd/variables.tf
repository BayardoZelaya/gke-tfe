variable "namespace" {
  type        = string
  default     = "argocd"
  description = "argocd k8s namespace"
}

variable "argocd_chart_version" {
  type    = string
  default = "9.5.21"
}

variable "argocd_values" {
  type        = any
  default     = {}
  description = "Additional Helm Values to merge into the ArgoCD release"
}

