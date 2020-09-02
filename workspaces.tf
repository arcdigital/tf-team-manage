data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = var.tfe_organization
}