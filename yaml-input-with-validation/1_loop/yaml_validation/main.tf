variable "input" {
  description = "YAML input to validate and standardize"
  type = object({
    name = string
    config = optional(object({
      nullable     = optional(string)
      not_nullable = optional(string)
    }), {})
  })
}

output "output" {
  description = "YAML object converted and validated against HCL variable"
  value       = var.input
}
