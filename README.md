# API Gateway Version 1

API gateway module for REST API. There is no community module available for REST API.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigw_cwl_role"></a> [apigw\_cwl\_role](#module\_apigw\_cwl\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.9.2 |

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_account.api_gateway_account](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_account) | resource |
| [aws_api_gateway_deployment.deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_method_settings.method_settings](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_rest_api.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_rest_api_policy.policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api_policy) | resource |
| [aws_api_gateway_stage.stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_api_gateway_vpc_link.vpc_link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_vpc_link) | resource |
| [aws_cloudwatch_log_group.log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_kms_key.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cloudwatch_logs_allow_apigw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body_template"></a> [body\_template](#input\_body\_template) | OpenAPI specification template | `string` | `""` | no |
| <a name="input_cache_cluster_enabled"></a> [cache\_cluster\_enabled](#input\_cache\_cluster\_enabled) | Specifies whether a cache cluster is enabled for the stage. | `bool` | `false` | no |
| <a name="input_cache_cluster_size"></a> [cache\_cluster\_size](#input\_cache\_cluster\_size) | The size of the cache cluster for the stage, if enabled | `string` | `"0.5"` | no |
| <a name="input_cache_data_encrypted"></a> [cache\_data\_encrypted](#input\_cache\_data\_encrypted) | Specifies whether a cache data needs to be encrypted. | `bool` | `true` | no |
| <a name="input_cache_ttl"></a> [cache\_ttl](#input\_cache\_ttl) | The cache TTL of the stage | `number` | `300` | no |
| <a name="input_caching_enabled"></a> [caching\_enabled](#input\_caching\_enabled) | Specifies whether caching is enabled for the API gateway method | `bool` | `false` | no |
| <a name="input_data_trace_enabled"></a> [data\_trace\_enabled](#input\_data\_trace\_enabled) | Specifies the logging level for this method. | `bool` | `false` | no |
| <a name="input_enable_global_apigw_logging"></a> [enable\_global\_apigw\_logging](#input\_enable\_global\_apigw\_logging) | Enable global apigw logging | `bool` | `false` | no |
| <a name="input_enable_resource_policy"></a> [enable\_resource\_policy](#input\_enable\_resource\_policy) | Enable resource policy to allow other resources to Invoke this API | `bool` | `false` | no |
| <a name="input_log_format"></a> [log\_format](#input\_log\_format) | Cloudwatch log format | `map(string)` | <pre>{<br>  "caller": "$context.identity.caller",<br>  "extendedRequestId": "$context.extendedRequestId",<br>  "httpMethod": "$context.httpMethod",<br>  "ip": "$context.identity.sourceIp",<br>  "protocol": "$context.protocol",<br>  "requestId": "$context.requestId",<br>  "requestTime": "$context.requestTime",<br>  "resourcePath": "$context.resourcePath",<br>  "responseLength": "$context.responseLength",<br>  "status": "$context.status",<br>  "user": "$context.identity.user"<br>}</pre> | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Custom log group name. | `string` | `""` | no |
| <a name="input_log_kms_key_id"></a> [log\_kms\_key\_id](#input\_log\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data | `string` | `""` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Cloudwatch log retention in days | `number` | `7` | no |
| <a name="input_logging_level"></a> [logging\_level](#input\_logging\_level) | Specifies the logging level for this method. | `string` | `"ERROR"` | no |
| <a name="input_metrics_enabled"></a> [metrics\_enabled](#input\_metrics\_enabled) | Specifies whether Amazon CloudWatch metrics are enabled for this method. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the API gateway | `string` | n/a | yes |
| <a name="input_resource_policy_json"></a> [resource\_policy\_json](#input\_resource\_policy\_json) | Resource policy as JSON to attach | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Name of the API gateway stage | `string` | n/a | yes |
| <a name="input_stage_variables"></a> [stage\_variables](#input\_stage\_variables) | Stage variables for the API gateway stage | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_tf_resources_hash"></a> [tf\_resources\_hash](#input\_tf\_resources\_hash) | for api gateways that are not using body\_template and are using terraform resources | `string` | `""` | no |
| <a name="input_throttling_burst_limit"></a> [throttling\_burst\_limit](#input\_throttling\_burst\_limit) | The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity. | `number` | `1000` | no |
| <a name="input_throttling_rate_limit"></a> [throttling\_rate\_limit](#input\_throttling\_rate\_limit) | The API request steady-state rate limit | `number` | `1000` | no |
| <a name="input_types"></a> [types](#input\_types) | Name of the API gateway stage | `list(string)` | <pre>[<br>  "REGIONAL"<br>]</pre> | no |
| <a name="input_vpc_links"></a> [vpc\_links](#input\_vpc\_links) | List of VPC links for REST APIs. key in the map denotes the vpc link name | <pre>map(<br>    object({<br>      description = string<br>      target_arns = list(string)<br>    })<br>  )</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_api_gateway_execution_arn"></a> [aws\_api\_gateway\_execution\_arn](#output\_aws\_api\_gateway\_execution\_arn) | The execution ARN part to be used in lambda\_permission source\_arn when allowing API Gateway to invoke a Lambda function |
| <a name="output_aws_api_gateway_rest_api_id"></a> [aws\_api\_gateway\_rest\_api\_id](#output\_aws\_api\_gateway\_rest\_api\_id) | REST API id of the created api |
| <a name="output_aws_api_gateway_rest_api_root_resource_id"></a> [aws\_api\_gateway\_rest\_api\_root\_resource\_id](#output\_aws\_api\_gateway\_rest\_api\_root\_resource\_id) | Root resource ID of the API Gateway REST API |
| <a name="output_aws_api_gateway_stage_arn"></a> [aws\_api\_gateway\_stage\_arn](#output\_aws\_api\_gateway\_stage\_arn) | ARN (for management) of apigw stage, use this when attaching Web ACL |
| <a name="output_aws_api_gateway_stage_execution_arn"></a> [aws\_api\_gateway\_stage\_execution\_arn](#output\_aws\_api\_gateway\_stage\_execution\_arn) | The execution ARN part to be used in lambda\_permission source\_arn when allowing API Gateway to invoke a Lambda function |
| <a name="output_aws_api_gateway_stage_invoke_url"></a> [aws\_api\_gateway\_stage\_invoke\_url](#output\_aws\_api\_gateway\_stage\_invoke\_url) | The URL to invoke the API pointing to the stage |
| <a name="output_aws_api_gateway_stage_name"></a> [aws\_api\_gateway\_stage\_name](#output\_aws\_api\_gateway\_stage\_name) | Stage name of the deployed api gateway stage |
| <a name="output_aws_api_gateway_vpc_link_id"></a> [aws\_api\_gateway\_vpc\_link\_id](#output\_aws\_api\_gateway\_vpc\_link\_id) | VPC link id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END_TF_DOCS -->