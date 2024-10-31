resource "kubernetes_namespace" "kiali_operator_namespace" {
  metadata {
    name = var.kiali_operator_namespace
  }
}

resource "argocd_application" "kiali-operator" {
  count = lower(var.deploy_method) == "argocd" ? 1 : 0

  metadata {
    name      = var.helm_chart_name
    namespace = var.argocd_namespace
  }

  spec {
    destination {
      server    = var.cluster_url
      namespace = kubernetes_namespace.kiali_operator_namespace.metadata[0].name
    }

    sync_policy {
      automated {}
    }

    source {
      repo_url        = var.helm_chart_repo
      chart           = var.helm_chart_name
      target_revision = var.helm_chart_version

      helm {
        values = var.helm_custom_values ? templatefile(var.helm_custom_values_path, {}) : ""
      }
    }
  }
}

resource "helm_release" "kiali-operator" {
  count = lower(var.deploy_method) == "helm" ? 1 : 0

  namespace  = kubernetes_namespace.kiali_operator_namespace.metadata[0].name
  name       = var.helm_chart_name
  chart      = var.helm_chart_name
  repository = var.helm_chart_repo
  version    = var.helm_chart_version

  values = var.helm_custom_values ? [templatefile(var.helm_custom_values_path, {})] : []
}

resource "kubernetes_manifest" "openid_server_cabundle" {
  count = var.use_openid_connect == true ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ConfigMap"
    "metadata" = {
      "name"      = "kiali-cabundle"
      "namespace" = "istio-system"
    }
    "data" = {
      "openid-server-ca.crt" = var.openid_server_pem_certificate
    }
  }
}

resource "kubernetes_manifest" "openid_secret" {
  count = var.use_openid_connect == true ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Secret"
    "metadata" = {
      "name"      = "kiali"
      "namespace" = "istio-system"
    }
    "data" = {
      "oidc-secret" = base64encode(var.openid_secret)
    }
  }
}
