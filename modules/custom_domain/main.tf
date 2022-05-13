# Provisioned only for regional types. @todo: Enhance for other types as well
resource "aws_api_gateway_domain_name" "domain" {
  domain_name              = var.domain_name
  regional_certificate_arn = var.cert_arn == "" ? aws_acm_certificate.cert[0].arn : var.cert_arn
  security_policy          = var.security_policy

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

resource "aws_acm_certificate" "cert" {
  count = var.create_acm_cert && var.cert_arn == "" ? 1 : 0

  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
