variable "rest_api_id" {
  description = "The ID of the REST API"
  type        = string
  default     = ""
}

variable "gateway_responses" {
  description = "map of gateway responses"
  type        = map(any)
  default     = {}
}
