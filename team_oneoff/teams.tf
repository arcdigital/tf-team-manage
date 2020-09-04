resource "tfe_team" "teams" {
  for_each     = var.teams
  name         = each.key
  organization = var.organization
  visibility   = "secret"
  organization_access {
    manage_policies     = length(regexall(".+_admin$", each.key)) > 0
    manage_workspaces   = length(regexall(".+_admin$", each.key)) > 0
    manage_vcs_settings = length(regexall(".+_admin$", each.key)) > 0
  }
}