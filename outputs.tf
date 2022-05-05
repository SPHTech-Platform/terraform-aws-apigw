output "aws_api_gateway_rest_api_id" {
  value       = aws_api_gateway_rest_api.api.id
  description = "REST API id of the created api"
}

output "aws_api_gateway_stage_execution_arn" {
  value       = aws_api_gateway_stage.stage.execution_arn
  description = "The execution ARN part to be used in lambda_permission source_arn when allowing API Gateway to invoke a Lambda function"
}

output "aws_api_gateway_stage_invoke_url" {
  value       = aws_api_gateway_stage.stage.invoke_url
  description = "The URL to invoke the API pointing to the stage"
}
