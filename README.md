# Velero Template

Terraform module which deploys Velero on any kubernetes cluster.

## Usage

```hcl
module "velero" {
  source  = "./modules/velero"

  namespace_name         = "velero"                                # The name of the Kubernetes namespace.
  chart_version          = "7.2.1"                                 # The version of the Velero Helm release chart
  velero_schedule        = "@every 24h"                            # The cron schedule for Velero backupsHelm chart
  velero_image           = "velero/velero-plugin-for-aws:v1.10.0"  # The image for Velero provider
  velero_provider        = "velero.io/aws"                         # Velero provider
  velero_bucket          = "dev-backup"                            # Bucket name
  s3url                  = "minio.domainname.com"                  # s3Url FQDN name
  aws_access_key_id      = AWS Access Key ID"                      # AWS Access Key ID
  aws_secret_access_key  = "AWS Secret Access Key"                 # AWS Secret Access Key

  resources = {
    limits = {
      cpu    = "2000m"
      memory = "4000Mi"
    }
    requests = {
      cpu    = "1000m"
      memory = "2000Mi"
    }
  }
}
```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.23.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [helm_release.example](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_secret.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubectl_manifest.test](https://registry.terraform.io/providers/alekc/kubectl/latest/docs/resources/kubectl_manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name) | Namespace where Rabbit MQ will be installed. | `string` | `"rabbit-mq"` | no |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version) | Version of the Rabbit MQ Helm chart. | `string` | `"15.0.1"` | no |
| <a name="input_velero_schedule"></a> [velero_schedule](#input_velero_schedule) | The cron schedule for Velero backups. | `string` | `"@every 24h"` | no |
| <a name="input_velero_image"></a> [velero_image](#input_velero_image) | The image for Velero provider. | `string` | `"velero/velero-plugin-for-aws:v1.10.0"` | no |
| <a name="input_velero_provider"></a> [velero_provider](#input_velero_provider) | Velero provider. | `string` | `"velero.io/aws"` | no |
| <a name="input_velero_bucket"></a> [velero_bucket](#input_velero_bucket) | Bucket name. | `string` | `""` | yes |
| <a name="input_s3url"></a> [s3url](#input_s3url) | s3Url FQDN name. | `string` | `"minio.domainname.com"` | yes |
| <a name="input_aws_access_key_id"></a> [aws_access_key_id](#input_aws_access_key_id) | AWS Access Key ID. | `string` | `""` | yes |
| <a name="input_aws_secret_access_key"></a> [aws_secret_access_key](#input_aws_secret_access_key) | AWS Secret Access Key. | `string` | `""` | yes |
| <a name="input_resources"></a> [resources](#input_resources) | Resource limits and requests for Cert-Manager pods. | `map(map(string))` | `"See example"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
