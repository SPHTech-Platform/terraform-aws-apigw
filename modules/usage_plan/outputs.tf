output "api_key_id" {
  description = "ID of the api keys"
  value = {
    for k, v in aws_api_gateway_api_key.api_key : k => v.id
    if var.enabled
  }
}
