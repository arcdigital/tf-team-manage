variable "tfe_token" {
  description = "Terraform API Token, must have owner access to the TFE org."
  type        = string
}

variable "tfe_hostname" {
  description = "TFE hostname."
  type        = string
}

variable "configuration" {
  description = "Configuration map with org name, group names, and filters"
  type = map(object({
    groups = set(string)
    filters = map(object({
    allow = list(string)
    deny  = list(string)
   }))
  }))
}
