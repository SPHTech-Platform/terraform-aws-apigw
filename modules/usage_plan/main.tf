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
}
