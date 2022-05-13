# Provisioned only for regional types. @todo: Enhance for other types as well
resource "aws_api_gateway_domain_name" "domain" {
  domain_name              = var.domain_name
  regional_certificate_arn = var.cert_arn
  security_policy          = "TLS_1_2"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

}

resource "aws_api_gateway_base_path_mapping" "mapping" {

  for_each = var.path_mappings

  api_id      = each.value.api_id
  stage_name  = each.value.stage_name
  base_path   = each.value.base_path
  domain_name = aws_api_gateway_domain_name.domain.domain_name
}
