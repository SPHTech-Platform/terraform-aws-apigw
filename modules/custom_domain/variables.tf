################################################################################
# variables for Custom domain mapping sub module
################################################################################

variable "domain_name" {
  description = "Custom domain name"
  type        = string
}

variable "security_policy" {
  description = "TLS Security Policy for the domain"
  type        = string
  default     = "TLS_1_2"
}

variable "create_acm_cert" {
  description = "Create ACM cert. create_acm_cert and cert_arn Mutually exclusive. "
  type        = bool
  default     = false
}

variable "cert_arn" {
  description = "Cert ARN. Create ACM cert. create_acm_cert and cert_arn Mutually exclusive."
  type        = string
  default     = ""
}

variable "path_mappings" {
  description = "List of stages the usage plan can be used "
  type = map(
    object({
      api_id     = string
      stage_name = string
      base_path  = string
    })
  )
}

variable "endpoint_type" {
  description = "Endpoint type."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = var.endpoint_type == "EDGE" || var.endpoint_type == "REGIONAL"
    error_message = "endpoint_type must be 'EDGE' or 'REGIONAL'."
  }
}
