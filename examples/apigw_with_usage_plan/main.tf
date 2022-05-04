provider "aws" {
  region  = "ap-southeast-1"
  profile = "sandbox"
}

module "api_gateway" {
  source = "../../../terraform-aws-apigw/"

  name  = "NewshubAPIV2"
  stage = "dev"

  body_template = file("templates/spec.yml")

  stage_variables = {
    "auth_lambda" : "newshub-auth-dev",
    "auth_url" : "xx.elb.ap-southeast-1.amazonaws.com"
  }
  data_trace_enabled = true
  metrics_enabled    = true
  logging_level      = "ERROR"

  cache_cluster_enabled = true
  cache_cluster_size    = "0.5"

  log_kms_key_id = "arn:aws:kms:ap-southeast-1:565040840361:key/1f44f216-af5d-4d82-bb53-6b772f882b66"

  log_format = "{ \"requestId\" : \"$context.requestId\" , \"ip\": \"$context.identity.sourceIp\", \"requestTime\":\"$context.requestTime\", \"httpMethod\":\"$context.httpMethod\",\"resourcePath\":\"$context.resourcePath\", \"path\" : \"$context.path\" , \"status\":\"$context.status\", \"responseLength\":\"$context.responseLength\",\"error\":\"$context.error.message\" , \"userAgent\" : \"$context.identity.userAgent\" , \"wafResponse\" : \"$context.wafResponseCode\" }"

}

module "api_gateway_usage_plan" {
  source = "../../../terraform-aws-apigw/modules/usage_plan"

  name = "NewshubAPI"

  stages = [
    {
      "stage" : "dev",
      "api_id" : module.api_gateway.aws_api_gateway_rest_api_id
    }
  ]
  api_keys = [
    { "key_name" : "key1", "enabled" : true },
    { "key_name" : "key2", "enabled" : true },
    { "key_name" : "key3", "enabled" : false },
    { "key_name" : "key4", "enabled" : true },
  ]
}
