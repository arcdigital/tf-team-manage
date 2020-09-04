locals {
  team_workspace = {
    for team in tfe_team.teams : team.id => {
      team_name = team.name
      team_id   = team.id
      group     = regex("_(.*)_", team.name)[0]
      workspaces = setsubtract(distinct(
        flatten([for regex in var.filters[regex("_(.*)_", team.name)[0]].allow :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))])),
        distinct(
          flatten([for regex in var.filters[regex("_(.*)_", team.name)[0]].deny :
        compact(flatten([for name, id in data.tfe_workspace_ids.all.external_ids : length(regexall(regex, name)) > 0 ? id : null]))]))
      )
    }
  }

  mappings = flatten([
    for team in keys(local.team_workspace) : [
      for workspace in local.team_workspace[team].workspaces : {
        permission = regex(".*_(.*)", local.team_workspace[team].team_name)[0]
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