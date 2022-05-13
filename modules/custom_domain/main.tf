resource "aws_api_gateway_domain_name" "domain" {
  domain_name              = var.domain_name
  regional_certificate_arn = var.cert_arn

  endpoint_configuration {
    types = ["REGIONAL"]
  }

}

resource "aws_api_gateway_base_path_mapping" "mapping" {

  for_each = var.path_mapptings

  api_id      = each.value.api_id
  stage_name  = each.value.stage_name
  base_path   = each.value.base_path
  domain_name = aws_api_gateway_domain_name.domain.domain_name
}
