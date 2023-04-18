################################################################################
# API Gateway
################################################################################

variable "name" {
  description = "Name of the API gateway"
  type        = string
}

variable "stage" {
  description = "Name of the API gateway stage"
  type        = string
}

variable "body_template" {
  description = "OpenAPI specification template"
  type        = string
  default     = ""
}

variable "stage_variables" {
  description = "Stage variables for the API gateway stage"
  type        = map(any)
  default     = {}
}

variable "types" {
  description = "Name of the API gateway stage"
  type        = list(string)
  default     = ["REGIONAL"]
}

variable "throttling_burst_limit" {
  description = "The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity."
  type        = number
  default     = 1000
}

variable "throttling_rate_limit" {
  description = "The API request steady-state rate limit"
  type        = number
  default     = 1000
}

variable "metrics_enabled" {
  description = "Specifies whether Amazon CloudWatch metrics are enabled for this method."
  type        = bool
  default     = false
}

variable "logging_level" {
  description = "Specifies the logging level for this method."
  type        = string
  default     = "ERROR"
}

variable "data_trace_enabled" {
  description = "Specifies the logging level for this method."
  type        = bool
  default     = false
}

variable "cache_cluster_enabled" {
  description = "Specifies whether a cache cluster is enabled for the stage."
  type        = bool
  default     = false
}

variable "cache_data_encrypted" {
  description = "Specifies whether a cache data needs to be encrypted."
  type        = bool
  default     = true
}

variable "cache_cluster_size" {
  description = "The size of the cache cluster for the stage, if enabled"
  type        = string
  default     = "0.5"
}

variable "log_group_name" {
  description = "Custom log group name."
  type        = string
  default     = ""
}

variable "log_format" {
  description = "Cloudwatch log format"
  type        = map(string)
  default     = {
    requestId         = "$context.requestId"
    extendedRequestId = "$context.extendedRequestId"
    ip                = "$context.identity.sourceIp"
    caller            = "$context.identity.caller"
    user              = "$context.identity.user"
    requestTime       = "$context.requestTime"
    httpMethod        = "$context.httpMethod"
    resourcePath      = "$context.resourcePath"
    status            = "$context.status"
    protocol          = "$context.protocol"
    responseLength    = "$context.responseLength"
  }
}

variable "log_retention_in_days" {
  description = "Cloudwatch log retention in days"
  type        = number
  default     = 7
}

variable "log_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data"
  type        = string
  default     = ""
}


variable "caching_enabled" {
  description = "Specifies whether caching is enabled for the API gateway method"
  type        = bool
  default     = false
}

variable "vpc_links" {
  description = "List of VPC links for REST APIs. key in the map denotes the vpc link name"
  type        = map(
    object({
      description = string
      target_arns = list(string)
    })
  )
  default = {}
}

variable "enable_global_apigw_logging" {
  description = "Enable global apigw logging"
  type        = bool
  default     = false
}

variable "disable_execute_api_endpoint" {
  description = "Disables the default API endpoint in favour of a custom domain"
  type        = bool
  default     = false
}
