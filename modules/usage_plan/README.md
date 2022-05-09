# Usage Plan

Create Usage Plan and assign it to the API

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_api_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_api_key) | resource |
| [aws_api_gateway_usage_plan.usage_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan) | resource |
| [aws_api_gateway_usage_plan_key.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_keys"></a> [api\_keys](#input\_api\_keys) | List of api keys created and assigned to the usage plan | `list(any)` | `[]` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default Tags for Auto Scaling Group | `map(string)` | `{}` | no |
| <a name="input_limit"></a> [limit](#input\_limit) | The maximum number of requests that can be made in a given time period. | `number` | `5000` | no |
| <a name="input_name"></a> [name](#input\_name) | Usage plan name | `string` | n/a | yes |
| <a name="input_offset"></a> [offset](#input\_offset) | The number of requests subtracted from the given limit in the initial time period. | `number` | `2` | no |
| <a name="input_period"></a> [period](#input\_period) | The time period in which the limit applies. Valid values are DAY, WEEK or MONTH. | `string` | `"MONTH"` | no |
| <a name="input_stages"></a> [stages](#input\_stages) | List of stages the usage plan can be used | `list(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
