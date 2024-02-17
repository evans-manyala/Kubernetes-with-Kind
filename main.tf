# Use local kubeconfig file
provider "kubernetes" {
  host                  = file("kubeconfig")
  cluster_ca_certificate = file("kubeconfig")
}

resource "kubernetes_deployment" "nodejs_app" {
  metadata {
    name = "nodejs-app"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nodejs-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "nodejs-app"
        }
      }

      spec {
        container {
          name  = "nodejs-app"
          image = "<username>/nodejs-app:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
