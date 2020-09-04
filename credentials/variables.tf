variable "organization" {
  description = "Organization to manage."
  type        = string
}

variable "filters" {
    description = "filters"
    type = map(object({
        lookup = list(string)
        allow = list(string)
        deny = list(string)
    }))
}

variable "aws_billing_id" {
    description = "AWS Billing Account Access Key ID"
    type = string
}

variable "aws_billing_secret" {
    description = "AWS Billing Account Secret Access Key"
    type = string
}

variable "aws_dev_id" {
    description = "AWS Dev Account Access Key ID"
    type = string
}

variable "aws_dev_secret" {
    description = "AWS Dev Account Secret Access Key"
    type = string
}

variable "aws_prod_id" {
    description = "AWS Prod Account Access Key ID"
    type = string
}

variable "aws_prod_secret" {
    description = "AWS Prod Account Secret Access Key"
    type = string
}

variable "aws_security_id" {
    description = "AWS Security Account Access Key ID"
    type = string
}

variable "aws_security_secret" {
    description = "AWS Security Account Secret Access Key"
    type = string
}