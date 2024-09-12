resource "kubernetes_namespace" "kiali-operator-namespace" {
  metadata {
    name = var.kiali-operator-namespace
  }
}

resource "argocd_application" "kiali-operator" {
  count = lower(var.deploy-method) == "argocd" ? 1 : 0

  metadata {
    name      = var.kiali-operator-name
    namespace = var.argocd-namespace
  }

  spec {
    destination {
      server    = var.cluster-url
      namespace = kubernetes_namespace.kiali-operator-namespace.metadata[0].name
    }

    sync_policy {
      automated {}
    }

    source {
      repo_url        = var.helm-chart-repo
      chart           = var.helm-chart-name
      target_revision = var.helm-chart-version

      helm {
        values = var.helm-custom-values ? templatefile(var.helm-custom-values-path, {}) : ""
      }
    }
  }
}


resource "helm_release" "kiali-operator" {
  count = lower(var.deploy-method) == "helm" ? 1 : 0

  namespace  = kubernetes_namespace.kiali-operator-namespace.metadata[0].name
  name       = var.helm-name
  chart      = var.helm-chart-name
  repository = var.helm-chart-repo
  version    = var.helm-chart-version

  values = var.helm-custom-values ? [templatefile(var.helm-custom-values-path, {})] : []
}
