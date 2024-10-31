variable "kubeconfig_path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Kubernetes Context to Use"
  type        = string
  default     = ""
}

variable "deploy_method" {
  description = "Choose Deploy Method ArgpCD or Helm"
  type        = string
}

variable "argocd_server" {
  description = "ArgoCD Server URL"
  type        = string
  default     = ""

  validation {
    condition     = !(lower(var.deploy_method) == "argocd" && var.argocd_server == "")
    error_message = "ArgoCD Server URL Must Not be NULL When Deploy Method is ArgoCD."
  }
}

variable "argocd_token" {
  description = "ArgoCD Token"
  type        = string
  sensitive   = true
  default     = ""

  validation {
    condition     = !(lower(var.deploy_method) == "argocd" && var.argocd_token == "")
    error_message = "ArgoCD Token Must Not be NULL When Deploy Method is ArgoCD."
  }
}

variable "tls_verify_skip" {
  description = "Skip SelfSigned Certificates Validate"
  type        = bool
  default     = false
}

variable "kiali_operator_namespace" {
  description = "Kiali Operator Namespace"
  type        = string
  default     = "kiali-operator"
}

variable "argocd_namespace" {
  description = "ArgoCD Namespace"
  type        = string
  default     = "argocd"
}

variable "cluster_url" {
  description = "Cluster URL"
  type        = string
  default     = "https://kubernetes.default.svc"
}

variable "helm_chart_name" {
  description = "Helm Chart Name"
  type        = string
  default     = "kiali-operator"
}

variable "helm_chart_repo" {
  description = "Helm Chart Repo"
  type        = string
  default     = "https://kiali.org/helm-charts"
}

variable "helm_chart_version" {
  description = "Helm Chart Version"
  type        = string
  default     = "1.89.3"
}

variable "helm_custom_values" {
  description = "Use Helm Custom Values"
  type        = bool
  default     = false
}

variable "helm_custom_values_path" {
  description = "Helm Custom Values Path"
  type        = string
  default     = ""

  validation {
    condition     = !(var.helm_custom_values && var.helm_custom_values_path == "")
    error_message = "Helm Custom Values Path must not be null when Helm Custom Values is true."
  }
}

variable "use_openid_connect" {
  description = "Use OpenID Connect Strategy"
  type        = bool
  default     = false
}

variable "openid_server_pem_certificate" {
  description = "OpenID Server PEM Certificate"
  type        = string
  default     = ""

  validation {
    condition     = !(var.use_openid_connect && var.openid_server_pem_certificate == "")
    error_message = "OpenID Server PEM Certificate must not be null when OpenID Connect is true."
  }
}

variable "openid_secret" {
  description = "OpenID Secret"
  type        = string
  sensitive   = true
  default     = ""

  validation {
    condition     = !(var.use_openid_connect && var.openid_secret == "")
    error_message = "OpenID Secret must not be null when OpenID Connect is true."
  }
}
