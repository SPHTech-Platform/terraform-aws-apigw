provider "aws" {
  region  = "ap-southeast-1"
  profile = "sandbox"
}

module "api_gateway" {
  source = "../../../terraform-aws-apigw/"
  name   = "NewshubAPIV2"
  stage  = "dev"

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

  key_names = { "key1" : "key1", "key2" : "key2" }
}


module "api_gateway_usage_plan" {
  source = "../../../terraform-aws-apigw/modules/usage_plan"
  name   = "NewshubAPI"
  stage  = "dev"
  api_id = module.api_gateway.aws_api_gateway_rest_api_id
}