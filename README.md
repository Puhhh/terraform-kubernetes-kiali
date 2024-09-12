<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | >= 1.7.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | 6.1.1 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.15.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [argocd_application.kiali-operator](https://registry.terraform.io/providers/oboukili/argocd/latest/docs/resources/application) | resource |
| [helm_release.kiali-operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.kiali-operator-namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd-namespace"></a> [argocd-namespace](#input\_argocd-namespace) | ArgoCD Namespace | `string` | `"argocd"` | no |
| <a name="input_argocd-server"></a> [argocd-server](#input\_argocd-server) | ArgoCD Server URL | `string` | `""` | no |
| <a name="input_argocd-token"></a> [argocd-token](#input\_argocd-token) | ArgoCD Token | `string` | `""` | no |
| <a name="input_cluster-url"></a> [cluster-url](#input\_cluster-url) | Cluster URL | `string` | `"https://kubernetes.default.svc"` | no |
| <a name="input_deploy-method"></a> [deploy-method](#input\_deploy-method) | Choose Deploy Method ArgpCD or Helm | `string` | n/a | yes |
| <a name="input_helm-chart-name"></a> [helm-chart-name](#input\_helm-chart-name) | Helm Chart Name | `string` | `"kiali-operator"` | no |
| <a name="input_helm-chart-repo"></a> [helm-chart-repo](#input\_helm-chart-repo) | Helm Chart Repo | `string` | `"https://kiali.org/helm-charts"` | no |
| <a name="input_helm-chart-version"></a> [helm-chart-version](#input\_helm-chart-version) | Helm Chart Version | `string` | `"1.89.3"` | no |
| <a name="input_helm-custom-values"></a> [helm-custom-values](#input\_helm-custom-values) | Use Helm Custom Values | `bool` | `false` | no |
| <a name="input_helm-custom-values-path"></a> [helm-custom-values-path](#input\_helm-custom-values-path) | Helm Custom Values Path | `string` | `""` | no |
| <a name="input_helm-name"></a> [helm-name](#input\_helm-name) | Helm Release Name | `string` | `"kiali"` | no |
| <a name="input_kiali-operator-name"></a> [kiali-operator-name](#input\_kiali-operator-name) | Kiali Operator Name | `string` | `"kiali-operator"` | no |
| <a name="input_kiali-operator-namespace"></a> [kiali-operator-namespace](#input\_kiali-operator-namespace) | Kiali Operator Namespace | `string` | `"kiali-operator"` | no |
| <a name="input_kube-context"></a> [kube-context](#input\_kube-context) | Kubernetes Context to Use | `string` | `""` | no |
| <a name="input_kubeconfig-path"></a> [kubeconfig-path](#input\_kubeconfig-path) | Kubeconfig Path | `string` | `"~/.kube/config"` | no |
| <a name="input_tls-verify-skip"></a> [tls-verify-skip](#input\_tls-verify-skip) | Skip SelfSigned Certificates Validate | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
