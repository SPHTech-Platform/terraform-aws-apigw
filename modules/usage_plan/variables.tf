################################################################################
# Usage plan configs used for API Gateway module
################################################################################

variable "name" {
  description = "Usage plan name"
  type        = string
}

variable "default_tags" {
  default = {
  }
  description = "Default Tags for Auto Scaling Group"
  type        = map(string)
}

# stages = {
#   stage1 = {
#     stage  = "stage_name"
#     api_id = "rest_api_id"
#   }
#   ...
# }
variable "stages" {
  description = "List of stages the usage plan can be used "
  type = map(
    object({
      api_id = string
      stage  = string
    })
  )
}

variable "quota_settings_unlimited" {
  description = "Specifies whether there is a unlimited quota limit ."
  type        = bool
  default     = false
}

variable "limit" {
  description = "The maximum number of requests that can be made in a given time period."
  type        = number
  default     = 5000
}

variable "offset" {
  description = "The number of requests subtracted from the given limit in the initial time period."
  type        = number
  default     = 2
}

variable "period" {
  description = "The time period in which the limit applies. Valid values are DAY, WEEK or MONTH."
  type        = string
  default     = "MONTH"
}

# api_keys = {
#   key1 = {
#     key_name : "key1"
#     enabled: true
#   }
#   key2 = {
#     key_name : "key2"
#     enabled: true
#   }
#   ...
# }
variable "api_keys" {
  description = "List of api keys created and assigned to the usage plan"
  type = map(
    object({
      key_name = string
      enabled  = bool
    })
  )
  default = {}
}
