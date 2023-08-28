# Custom domain name for API Gateway

Provides custom domain name resource for the API Gateway and the mapping of domain name to the api.

Supports only REGIONAL endpoint for now.

Provisions option to create ACM certifcation. Cert validation needs to be done offline.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_api_gateway_base_path_mapping.mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_base_path_mapping) | resource |
| [aws_api_gateway_domain_name.domain_edge](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_domain_name) | resource |
| [aws_api_gateway_domain_name.domain_regional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_domain_name) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cert_arn"></a> [cert\_arn](#input\_cert\_arn) | Cert ARN. Create ACM cert. create\_acm\_cert and cert\_arn Mutually exclusive. | `string` | `""` | no |
| <a name="input_create_acm_cert"></a> [create\_acm\_cert](#input\_create\_acm\_cert) | Create ACM cert. create\_acm\_cert and cert\_arn Mutually exclusive. | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Custom domain name | `string` | n/a | yes |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | Endpoint type. | `string` | `"REGIONAL"` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | Specifies the algorithm of the public and private key pair that your Amazon issued certificate uses to encrypt data | `string` | `"RSA_2048"` | no |
| <a name="input_path_mappings"></a> [path\_mappings](#input\_path\_mappings) | List of stages the usage plan can be used | <pre>map(<br>    object({<br>      api_id     = string<br>      stage_name = string<br>      base_path  = string<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_security_policy"></a> [security\_policy](#input\_security\_policy) | TLS Security Policy for the domain | `string` | `"TLS_1_2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of domain name. |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | hostname for custom domain regional/cloudfront endpoint |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | hosted zone id of custom domain |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
