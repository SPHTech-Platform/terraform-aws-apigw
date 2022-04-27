# API Gateway Version 1

API gateway module for REST API. There is no community module available for REST API.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_deployment.deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_method_settings.method_settings](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_rest_api.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body_template"></a> [body\_template](#input\_body\_template) | OpenAPI specification template | `string` | `""` | no |
| <a name="input_cache_cluster_enabled"></a> [cache\_cluster\_enabled](#input\_cache\_cluster\_enabled) | Specifies whether a cache cluster is enabled for the stage. | `bool` | `false` | no |
| <a name="input_cache_cluster_size"></a> [cache\_cluster\_size](#input\_cache\_cluster\_size) | The size of the cache cluster for the stage, if enabled | `string` | `"0.5"` | no |
| <a name="input_data_trace_enabled"></a> [data\_trace\_enabled](#input\_data\_trace\_enabled) | Specifies the logging level for this method. | `bool` | `false` | no |
| <a name="input_key_names"></a> [key\_names](#input\_key\_names) | Key names | `map(any)` | `{}` | no |
| <a name="input_log_format"></a> [log\_format](#input\_log\_format) | Cloudwatch log format | `string` | `""` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Custom log group name. | `string` | `""` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Cloudwatch log retention in days | `number` | `7` | no |
| <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level) | Specifies the logging level for this method. | `string` | `"OFF"` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Specifies whether Amazon CloudWatch metrics are enabled for this method. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the API gateway | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | Name of the API gateway stage | `string` | n/a | yes |
| <a name="input_stage_variables"></a> [stage\_variables](#input\_stage\_variables) | Stage variables for the API gateway stage | `map(any)` | `{}` | no |
| <a name="input_throttling_burst_limit"></a> [throttling\_burst\_limit](#input\_throttling\_burst\_limit) | The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity. | `number` | `1000` | no |
| <a name="input_throttling_rate_limit"></a> [throttling\_rate\_limit](#input\_throttling\_rate\_limit) | The API request steady-state rate limit | `number` | `1000` | no |
| <a name="input_types"></a> [types](#input\_types) | Name of the API gateway stage | `list(string)` | <pre>[<br>  "REGIONAL"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
<<<<<<< HEAD
| <a name="output_aws_api_gateway_rest_api_id"></a> [aws\_api\_gateway\_rest\_api\_id](#output\_aws\_api\_gateway\_rest\_api\_id) | REST API id of the creted api |
<!-- END_TF_DOCS -->
=======
| <a name="output_aws_api_gateway_rest_api_id"></a> [aws\_api\_gateway\_rest\_api\_id](#output\_aws\_api\_gateway\_rest\_api\_id) | n/a |
<!-- END_TF_DOCS -->
>>>>>>> c0a3f6433ed66da766c454bb0be1ed5c108947d9
