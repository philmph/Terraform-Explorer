variable "nullable" {
  default     = "module-default"
  description = "Test input for nullable"
  type        = string
  nullable    = true # default
}

variable "not_nullable" {
  default     = "module-default"
  description = "Test input for not_nullable"
  type        = string
  nullable    = false
}
