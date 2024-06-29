resource "random_pet" "this" {
  count = var.use_custom_name ? 0 : 1
}

locals {
  prefix = var.use_custom_name ? "${var.custom_name_prefix}-" : ""
  name   = var.use_custom_name ? "${local.prefix}${var.custom_name}" : random_pet.this[0].id
}

output "name" {
  description = "Name of the resource"
  value       = local.name
}
