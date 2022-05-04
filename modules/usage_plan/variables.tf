################################################################################
# Usage plan configs used for API Gateway module
################################################################################

variable "name" {
  description = "Usage plan name"
  type        = string
}

variable "stages" {
  description = "List of stages the usage plan can be used "
  type        = list(any)
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

variable "api_keys" {
  description = "List of api keys created and assigned to the usage plan"
  type        = list(any)
  default     = []
  # It is a list of objects with the keyname and enabled flag. ex: [ { "key_name" : "key1", "enabled" : true }]
}
