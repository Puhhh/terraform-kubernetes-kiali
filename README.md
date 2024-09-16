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
| [kubernetes_manifest.openid_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.openid_server_cabundle](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.kiali_operator_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | ArgoCD Namespace | `string` | `"argocd"` | no |
| <a name="input_argocd_server"></a> [argocd\_server](#input\_argocd\_server) | ArgoCD Server URL | `string` | `""` | no |
| <a name="input_argocd_token"></a> [argocd\_token](#input\_argocd\_token) | ArgoCD Token | `string` | `""` | no |
| <a name="input_cluster_url"></a> [cluster\_url](#input\_cluster\_url) | Cluster URL | `string` | `"https://kubernetes.default.svc"` | no |
| <a name="input_deploy_method"></a> [deploy\_method](#input\_deploy\_method) | Choose Deploy Method ArgpCD or Helm | `string` | n/a | yes |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | Helm Chart Name | `string` | `"kiali-operator"` | no |
| <a name="input_helm_chart_repo"></a> [helm\_chart\_repo](#input\_helm\_chart\_repo) | Helm Chart Repo | `string` | `"https://kiali.org/helm-charts"` | no |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Helm Chart Version | `string` | `"1.89.3"` | no |
| <a name="input_helm_custom_values"></a> [helm\_custom\_values](#input\_helm\_custom\_values) | Use Helm Custom Values | `bool` | `false` | no |
| <a name="input_helm_custom_values_path"></a> [helm\_custom\_values\_path](#input\_helm\_custom\_values\_path) | Helm Custom Values Path | `string` | `""` | no |
| <a name="input_helm_name"></a> [helm\_name](#input\_helm\_name) | Helm Release Name | `string` | `"kiali"` | no |
| <a name="input_kiali_operator_name"></a> [kiali\_operator\_name](#input\_kiali\_operator\_name) | Kiali Operator Name | `string` | `"kiali-operator"` | no |
| <a name="input_kiali_operator_namespace"></a> [kiali\_operator\_namespace](#input\_kiali\_operator\_namespace) | Kiali Operator Namespace | `string` | `"kiali-operator"` | no |
| <a name="input_kube_context"></a> [kube\_context](#input\_kube\_context) | Kubernetes Context to Use | `string` | `""` | no |
| <a name="input_kubeconfig_path"></a> [kubeconfig\_path](#input\_kubeconfig\_path) | Kubeconfig Path | `string` | `"~/.kube/config"` | no |
| <a name="input_openid_secret"></a> [openid\_secret](#input\_openid\_secret) | OpenID Secret | `string` | `""` | no |
| <a name="input_openid_server_pem_certificate"></a> [openid\_server\_pem\_certificate](#input\_openid\_server\_pem\_certificate) | OpenID Server PEM Certificate | `string` | `""` | no |
| <a name="input_tls_verify_skip"></a> [tls\_verify\_skip](#input\_tls\_verify\_skip) | Skip SelfSigned Certificates Validate | `bool` | `false` | no |
| <a name="input_use_openid_connect"></a> [use\_openid\_connect](#input\_use\_openid\_connect) | Use OpenID Connect Strategy | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
