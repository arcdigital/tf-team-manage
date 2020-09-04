module "team_full" {
  source = "./team_full"

  for_each     = var.configuration
  organization = each.key
  groups       = each.value.groups
  filters      = each.value.filters
}

module "team_oneoff" {
  source = "./team_oneoff"

  for_each     = var.configuration
  organization = each.key
  teams        = each.value.teams
}

module "creds" {
  source = "./credentials"

  for_each = var.configuration

  organization = each.key
  filters      = each.value.credentials

  aws_billing_id      = var.aws_billing_id
  aws_billing_secret  = var.aws_billing_secret
  aws_dev_id          = var.aws_dev_id
  aws_dev_secret      = var.aws_dev_secret
  aws_prod_id         = var.aws_prod_id
  aws_prod_secret     = var.aws_prod_secret
  aws_security_id     = var.aws_security_id
  aws_security_secret = var.aws_security_secret
}
