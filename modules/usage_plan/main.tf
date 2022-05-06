resource "aws_api_gateway_usage_plan" "usage_plan" {
  name        = var.name
  description = "Usage plan created for ${var.name}"

  dynamic "api_stages" {
    for_each = [for s in var.stages : {
      api_id = s.api_id
      stage  = s.stage
    }]

    content {
      api_id = api_stages.value.api_id
      stage  = api_stages.value.stage
    }

  }

  quota_settings {
    limit  = var.limit
    offset = var.offset
    period = var.period
  }

  tags = {
    Name = var.name
  }
}

resource "aws_api_gateway_api_key" "key" {
  for_each = { for api_key in var.api_keys : api_key.key_name => api_key }

  name        = each.key
  description = "API Key for ${each.key}"
  enabled     = each.value.enabled

  tags = {
    Name = each.key
  }

}

resource "aws_api_gateway_usage_plan_key" "main" {
  for_each = { for api_key in var.api_keys : api_key.key_name => api_key }

  key_id        = aws_api_gateway_api_key.key[each.key].id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
}
