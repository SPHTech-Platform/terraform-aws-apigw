resource "terraform_data" "body_change_trigger" {
  triggers_replace = [
    sha256(var.body_template)
  ]
}

resource "aws_api_gateway_rest_api_policy" "policy_attachment" {
  count = var.enable_resource_policy ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.api.id
  policy      = var.resource_policy_json

  lifecycle {
    replace_triggered_by = [
      terraform_data.body_change_trigger
    ]
  }
}
