locals {
  permissions = ["plan", "write", "admin"]
  team_names = toset([for pair in setproduct(var.groups, local.permissions) : "${var.organization}_${pair[0]}_${pair[1]}"])
  team_names_read = toset([for group in var.groups : "${var.organization}_${group}_read"])
}

resource "tfe_team" "teams" {
  for_each     = local.team_names
  name         = each.key
  organization = var.organization
  visibility   = "secret"
  organization_access {
    manage_policies     = length(regexall(".+_admin$", each.key)) > 0
    manage_workspaces   = length(regexall(".+_admin$", each.key)) > 0
    manage_vcs_settings = length(regexall(".+_admin$", each.key)) > 0
  }
}

resource "tfe_team" "teams_read" {
  for_each     = local.team_names_read
  name         = each.key
  organization = var.organization
  visibility   = "secret"
  organization_access {
    manage_policies     = false
    manage_workspaces   = false
    manage_vcs_settings = false
  }
}