resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.7.10" # Omitted to always use the latest.
  namespace        = "argocd"
  create_namespace = true
  atomic           = true
  cleanup_on_fail  = true
  timeout          = 300
  values           = [file("${path.module}/argocd-values.yaml")]
  wait_for_jobs    = true
}