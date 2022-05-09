locals {
  common_tags = {
    "sph:env"          = "dev"
    "sph:app-tier"     = "1"
    "sph:appIC"        = "Prem Kumar Kailasu"
    "sph:appteam"      = "dstf"
    "sph:managed-by"   = "dstf"
    "sph:cost-centre"  = "1691"
    "sph:product"      = "hcp"
    "sph:biz-dept"     = "DPE"
    "sph:biz-owner"    = "Jensen"
    "sph:biz-email"    = "***REMOVED***"
    "sph:creator-name" = "dstf"
    "sph:creator-email" = join(":", [
      "***REMOVED***"
    ])

    "sph:provisioned-via" = "terraform"
  }
}
provider "aws" {
  region = "ap-southeast-1"

  default_tags {
    tags = local.common_tags
  }
}



module "api_gateway" {
  source = "../../../terraform-aws-apigw/"

  name  = "PetStoreSandbox"
  stage = "dev"

  body_template = file("templates/spec.yml")

  stage_variables = {
    "var1" : "variable 1",
    "var2" : "variable 2"
  }
  data_trace_enabled = true
  metrics_enabled    = true
  logging_level      = "ERROR"

  cache_cluster_enabled = true
  cache_cluster_size    = "0.5"

  log_format = {
    requestId      = "$context.requestId"
    ip             = "$context.identity.sourceIp"
    requestTime    = "$context.requestTime"
    httpMethod     = "$context.httpMethod"
    resourcePath   = "$context.resourcePath"
    path           = "$context.path"
    status         = "$context.status"
    responseLength = "$context.responseLength"
    error          = "$context.error.message"
    userAgent      = "$context.identity.userAgent"
    wafResponse    = "$context.wafResponseCode"
  }

}

module "api_gateway_usage_plan" {
  source = "../../../terraform-aws-apigw/modules/usage_plan"

  name = "PetStoreSandbox-usage-plan"

  stages = [
    {
      "stage" : module.api_gateway.aws_api_gateway_stage_name,
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
