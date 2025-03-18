# Preferred to be able to use module default values and keeping it readable
variable "input1" {
  type = list(object({
    name         = string
    nullable     = optional(string)
    not_nullable = optional(string)
  }))
}

variable "input2_w_defaults" {
  type = list(object({
    name         = string
    nullable     = optional(string, "input-default")
    not_nullable = optional(string, "input-default")
  }))
}
