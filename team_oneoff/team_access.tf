locals {
  team_workspace = {
    for team in tfe_team.teams : team.id => {
      team_name = team.name
      team_id   = team.id
      permission = var.teams[team.name].permission
      workspaces = setsubtract(distinct(
        flatten([for regex in var.teams[team.name].allow :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.teams[team.name].deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
      )
    }
  }

  mappings = flatten([
    for team in keys(local.team_workspace) : [
      for workspace in local.team_workspace[team].workspaces : {
        permission = local.team_workspace[team].permission
        team       = team
        workspace  = workspace
      }
    ]
  ])  
}

resource "tfe_team_access" "all" {
  for_each = {
    for mapping in local.mappings : "${mapping.team}.${mapping.workspace}" => mapping
  }

  access       = each.value.permission
  team_id      = each.value.team
  workspace_id = each.value.workspace
}