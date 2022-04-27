################################################################################
# Usage plan configs used for API Gateway module
################################################################################

variable "name" {
  description = "Usage plan name"
  type        = string
}

variable "api_id" {
  description = "Id of the API gateway"
  type        = string
}


variable "stage" {
  description = "Name of the API gateway stage used for the usage plan"
  type        = string
}

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
