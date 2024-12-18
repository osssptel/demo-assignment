module "argocd" {
  source = "../modules/argocd"
}

module "airflow" {
  depends_on = [module.argocd]
  source     = "../modules/airflow"
}