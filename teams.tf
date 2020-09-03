module "teams" {
  source = "./team-management"

  for_each = var.configuration
  organization = each.key
  groups = each.value.groups
  filters = each.value.filters
}
