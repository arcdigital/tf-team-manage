variable "organization" {
  description = "Organization to manage."
  type        = string
}

variable "teams" {
  description = "List of teams to add"
  type = map(object({
      permission = string
      allow = list(string)
      deny  = list(string)
    }))
}