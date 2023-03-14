output "arn" {
  value       = var.endpoint_type == "EDGE" ? aws_api_gateway_domain_name.domain_edge[0].arn : aws_api_gateway_domain_name.domain_regional[0].arn
  description = "ARN of domain name."
}
