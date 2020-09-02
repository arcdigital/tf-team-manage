provider "tfe" {
  version  = "~> 0.21.0"
  token    = var.tfe_token
  hostname = var.tfe_hostname
}