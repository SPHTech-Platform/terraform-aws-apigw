data "aws_iam_policy_document" "allow_policy" {
  count = var.enable_resource_policy ? 1 : 0

  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.resource_policy_identifier
    }

    actions   = ["execute-api:Invoke"]
    resources = [aws_api_gateway_rest_api.api.execution_arn]
  }
}
resource "aws_api_gateway_rest_api_policy" "policy_attachment" {
  count = var.enable_resource_policy ? 1 : 0

  rest_api_id = aws_api_gateway_rest_api.api.id
  policy      = data.aws_iam_policy_document.allow_policy.json
}
