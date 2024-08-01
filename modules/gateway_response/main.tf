resource "aws_api_gateway_gateway_response" "wrapper" {
  for_each = var.gateway_responses

  rest_api_id   = var.rest_api_id
  status_code   = each.key
  response_type = each.value.response_type

  response_templates  = each.value.response_templates
  response_parameters = each.value.response_parameters
}
