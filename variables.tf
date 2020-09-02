variable "tfe_token" {
  description = "Terraform API Token, must have owner access to the TFE org."
  type        = string
}

variable "tfe_organization" {
  description = "Organization to manage."
  type        = string
}

variable "tfe_hostname" {
  description = "TFE hostname."
  type        = string
}

variable "groups" {
  description = "List of group prefixes"
  type        = set(string)
}

variable "groups_filter" {
  type = map(object({
    allow = list(string)
    deny  = list(string)
  }))
  description = "Map of filters by group"
}

variable "permissions" {
  type        = list(string)
  description = "List of permission suffixes"
  default     = ["read", "plan", "write", "admin"]
}