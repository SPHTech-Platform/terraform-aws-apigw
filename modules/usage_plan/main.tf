resource "aws_api_gateway_usage_plan" "usage_plan" {
  name        = var.name
  description = "Usage plan created for ${var.name}"

  api_stages {
    api_id = var.api_id
    stage  = var.stage
  }

  quota_settings {
    limit  = var.limit
    offset = var.offset
    period = var.period
  }
}