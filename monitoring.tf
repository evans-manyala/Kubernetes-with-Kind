# Using Helm provider
provider "helm" {
  repositories = ["bitnami"]
}

resource "helm_release" "monitoring" {
  repository = "bitnami/kube-prometheus-stack"
  name       = "monitoring"

  # Configure release (replace with desired values)
  values = <<EOF
  grafana:
    ingress:
      enabled: true
      hostname: "monitoring.example.com"
  prometheus:
    server:
      retention: 1d
  alertmanager:
    ingress:
      enabled
