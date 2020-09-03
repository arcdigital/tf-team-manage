data "tfe_workspace_ids" "all" {
  names        = ["*"]
  organization = var.organization
}