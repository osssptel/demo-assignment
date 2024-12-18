output "demo" {
  sensitive = true
  value = {
    network = module.vpc
    cluster = module.eks
    workloads = {
      argocd  = module.argocd
      airflow = module.airflow
    }
  }
}