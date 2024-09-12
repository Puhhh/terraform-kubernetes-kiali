variable "kubeconfig-path" {
  description = "Kubeconfig Path"
  type        = string
  default     = "~/.kube/config"
}

variable "kube-context" {
  description = "Kubernetes Context to Use"
  type        = string
  default     = ""
}

variable "deploy-method" {
  description = "Choose Deploy Method ArgpCD or Helm"
  type        = string
}

variable "argocd-server" {
  description = "ArgoCD Server URL"
  type        = string
  default     = ""

  validation {
    condition     = !(lower(var.deploy-method) == "argocd" && var.argocd-server == "")
    error_message = "ArgoCD Server URL Must Not be NULL When Deploy Method is ArgoCD."
  }
}

variable "argocd-token" {
  description = "ArgoCD Token"
  type        = string
  sensitive   = true
  default     = ""

  validation {
    condition     = !(lower(var.deploy-method) == "argocd" && var.argocd-token == "")
    error_message = "ArgoCD Token Must Not be NULL When Deploy Method is ArgoCD."
  }
}

variable "tls-verify-skip" {
  description = "Skip SelfSigned Certificates Validate"
  type        = bool
  default     = false
}

variable "kiali-operator-namespace" {
  description = "Kiali Operator Namespace"
  type        = string
  default     = "kiali-operator"
}

variable "kiali-operator-name" {
  description = "Kiali Operator Name"
  type        = string
  default     = "kiali-operator"
}

variable "argocd-namespace" {
  description = "ArgoCD Namespace"
  type        = string
  default     = "argocd"
}

variable "cluster-url" {
  description = "Cluster URL"
  type        = string
  default     = "https://kubernetes.default.svc"
}

variable "helm-name" {
  description = "Helm Release Name"
  type        = string
  default     = "kiali"
}

variable "helm-chart-name" {
  description = "Helm Chart Name"
  type        = string
  default     = "kiali-operator"
}

variable "helm-chart-repo" {
  description = "Helm Chart Repo"
  type        = string
  default     = "https://kiali.org/helm-charts"
}

variable "helm-chart-version" {
  description = "Helm Chart Version"
  type        = string
  default     = "1.89.3"
}

variable "helm-custom-values" {
  description = "Use Helm Custom Values"
  type        = bool
  default     = false
}

variable "helm-custom-values-path" {
  description = "Helm Custom Values Path"
  type        = string
  default     = ""

  validation {
    condition     = !(var.helm-custom-values && var.helm-custom-values-path == "")
    error_message = "helm-custom-values-path must not be null when helm-custom-values is true."
  }
}
