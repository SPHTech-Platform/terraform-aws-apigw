# Usage Plan

Create Usage Plan and assign it to the API

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_usage_plan.usage_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | Id of the API gateway | `string` | n/a | yes |
| <a name="input_limit"></a> [limit](#input\_limit) | The maximum number of requests that can be made in a given time period. | `number` | `5000` | no |
| <a name="input_name"></a> [name](#input\_name) | Usage plan name | `string` | n/a | yes |
| <a name="input_offset"></a> [offset](#input\_offset) | The number of requests subtracted from the given limit in the initial time period. | `number` | `2` | no |
| <a name="input_period"></a> [period](#input\_period) | The time period in which the limit applies. Valid values are DAY, WEEK or MONTH. | `string` | `"MONTH"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Name of the API gateway stage used for the usage plan | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->