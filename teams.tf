module "cloud_team" {
  source = "./team-management"

  organization = var.organization
  groups = var.groups
  filters = var.filters
  permissions = var.permissions
}
