resource "kubectl_manifest" "airflow" {
  yaml_body = file("${path.module}/airflow-application.yaml")
}