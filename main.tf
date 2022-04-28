
resource "aws_api_gateway_rest_api" "api" {
  body = var.body_template

  name = var.name

  endpoint_configuration {
    types = var.types
  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "stage" {
  #checkov:skip=CKV_AWS_120:Caching should be optional as caching is disabled for some applications
  #checkov:skip=CKV2_AWS_29:Since apigw can be protected by Cloudfront
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id

  stage_name            = var.stage
  variables             = var.stage_variables
  xray_tracing_enabled  = true
  cache_cluster_enabled = var.cache_cluster_enabled
  cache_cluster_size    = var.cache_cluster_size


  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.log_group.arn
    format          = var.log_format
  }
}


resource "aws_cloudwatch_log_group" "log_group" {
  #Custom name if it is imported
  name              = var.log_group_name != "" ? var.log_group_name : "${var.name}-access-logs"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = var.log_kms_key_id
}




resource "aws_api_gateway_method_settings" "method_settings" {
  #checkov:skip=CKV_AWS_225:Caching should be optional as caching is disabled for some applications
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = aws_api_gateway_stage.stage.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled        = var.metrics_enabled
    logging_level          = var.logging_level
    data_trace_enabled     = var.data_trace_enabled
    throttling_burst_limit = var.throttling_burst_limit
    throttling_rate_limit  = var.throttling_rate_limit
    cache_data_encrypted   = true
    caching_enabled        = var.caching_enabled
  }
}
