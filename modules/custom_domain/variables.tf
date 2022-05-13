################################################################################
# variables for Custom domain mapping sub module
################################################################################

variable "domain_name" {
  description = "Custom domain name"
  type        = string
}

variable "cert_arn" {
  description = "Cert ARN"
  type        = string
}

variable "path_mapptings" {
  description = "List of stages the usage plan can be used "
  type = map(
    object({
      api_id     = string
      stage_name = string
      base_path  = string
    })
  )
}
