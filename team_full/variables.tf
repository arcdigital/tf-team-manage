variable "organization" {
  description = "Organization to manage."
  type        = string
}

variable "groups" {
  description = "List of group prefixes"
  type        = set(string)
}

variable "filters" {
  type = map(object({
    allow = list(string)
    deny  = list(string)
  }))
  description = "Map of filters by group"
}