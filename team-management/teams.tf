locals {
  team_names = toset([for pair in setproduct(var.groups, var.permissions) : "${var.organization}_${pair[0]}_${pair[1]}"])
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