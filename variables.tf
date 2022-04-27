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

##Usage Plan Config##

variable "limit" {
  description = "The maximum number of requests that can be made in a given time period."
  default     = 5000
}

variable "offset" {
  description = "The number of requests subtracted from the given limit in the initial time period."
  default     = 2
}

variable "period" {
  description = "The time period in which the limit applies. Valid values are DAY, WEEK or MONTH."
  default     = "MONTH"
}

variable "throttling_burst_limit" {
  description = "The API request burst limit, the maximum rate limit over a time ranging from one to a few seconds, depending upon whether the underlying token bucket is at its full capacity."
  default     = 1000
}

variable "throttling_rate_limit" {
  description = "The API request steady-state rate limit"
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
  default     = "OFF"
}

variable "data_trace_enabled" {
  description = "Specifies the logging level for this method."
  type        = bool
  default     = false
}

variable "xray_tracing_enabled" {
  description = "Whether active tracing with X-ray is enabled."
  type        = bool
  default     = false
}

variable "cache_cluster_enabled" {
  description = "Specifies whether a cache cluster is enabled for the stage."
  type        = bool
  default     = false
}

variable "cache_cluster_size" {
  description = "The size of the cache cluster for the stage, if enabled"
  type        = string
  default     = ""
}

variable "enable_cloud_watch_log" {
  description = "Specifies whether a cloud watch log enabled."
  type        = bool
  default     = false
}

variable "log_group_name" {
  description = "Custom log group name."
  type        = string
  default     = ""
}

variable "log_format" {
  description = "Cloudwatch log format"
  type        = string
  default     = ""
}

variable "log_retention_in_days" {
  description = "Cloudwatch log retention in days"
  type        = number
  default     = 7
}


variable "key_names" {
  description = "Key names"
  type        = map(any)
  default     = {}
}
