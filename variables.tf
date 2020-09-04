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
    teams = map(object({
      permission = string
      allow      = list(string)
      deny       = list(string)
    }))
    credentials = map(object({
      lookup = list(string)
      allow  = list(string)
      deny   = list(string)
    }))
  }))
}

variable "aws_billing_id" {
  description = "AWS Billing Account Access Key ID"
  type        = string
}

variable "aws_billing_secret" {
  description = "AWS Billing Account Secret Access Key"
  type        = string
}

variable "aws_dev_id" {
  description = "AWS Dev Account Access Key ID"
  type        = string
}

variable "aws_dev_secret" {
  description = "AWS Dev Account Secret Access Key"
  type        = string
}

variable "aws_prod_id" {
  description = "AWS Prod Account Access Key ID"
  type        = string
}

variable "aws_prod_secret" {
  description = "AWS Prod Account Secret Access Key"
  type        = string
}

variable "aws_security_id" {
  description = "AWS Security Account Access Key ID"
  type        = string
}

variable "aws_security_secret" {
  description = "AWS Security Account Secret Access Key"
  type        = string
}