locals {
    billing_workspaces = setsubtract(distinct(
        flatten([for regex in concat(var.filters.billing.lookup, var.filters.billing.allow) :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.filters.billing.deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
    )   

    prod_workspaces = setsubtract(distinct(
        flatten([for regex in concat(var.filters.prod.lookup, var.filters.prod.allow) :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.filters.prod.deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
    )    

    dev_workspaces = setsubtract(distinct(
        flatten([for regex in concat(var.filters.dev.lookup, var.filters.dev.allow) :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.filters.dev.deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
    )    

    security_workspaces = setsubtract(distinct(
        flatten([for regex in concat(var.filters.security.lookup, var.filters.security.allow) :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.filters.security.deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
    )    
}

resource "tfe_variable" "aws_billing_id" {
    for_each = local.billing_workspaces
    
    key = "AWS_ACCESS_KEY_ID"
    value = var.aws_billing_id
    category = "env"
    sensitive = false
    workspace_id = each.key
}

resource "tfe_variable" "aws_billing_secret" {
    for_each = local.billing_workspaces

    key = "AWS_SECRET_ACCESS_KEY"
    value = var.aws_billing_secret
    category = "env"
    sensitive = true
    workspace_id = each.key
}

resource "tfe_variable" "aws_prod_id" {
    for_each = local.prod_workspaces
    
    key = "AWS_ACCESS_KEY_ID"
    value = var.aws_prod_id
    category = "env"
    sensitive = false
    workspace_id = each.key
}

resource "tfe_variable" "aws_prod_secret" {
    for_each = local.prod_workspaces

    key = "AWS_SECRET_ACCESS_KEY"
    value = var.aws_prod_secret
    category = "env"
    sensitive = true
    workspace_id = each.key
}

resource "tfe_variable" "aws_dev_id" {
    for_each = local.dev_workspaces
    
    key = "AWS_ACCESS_KEY_ID"
    value = var.aws_dev_id
    category = "env"
    sensitive = false
    workspace_id = each.key
}

resource "tfe_variable" "aws_dev_secret" {
    for_each = local.dev_workspaces

    key = "AWS_SECRET_ACCESS_KEY"
    value = var.aws_dev_secret
    category = "env"
    sensitive = true
    workspace_id = each.key
}

resource "tfe_variable" "aws_security_id" {
    for_each = local.security_workspaces
    
    key = "AWS_ACCESS_KEY_ID"
    value = var.aws_security_id
    category = "env"
    sensitive = false
    workspace_id = each.key
}

resource "tfe_variable" "aws_security_secret" {
    for_each = local.security_workspaces

    key = "AWS_SECRET_ACCESS_KEY"
    value = var.aws_security_secret
    category = "env"
    sensitive = true
    workspace_id = each.key
}
