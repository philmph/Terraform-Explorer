module "input1" {
  source = "../module"

  for_each = { for i, o in var.input1 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "input2_w_defaults" {
  source = "../module"

  for_each = { for i, o in var.input2_w_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}
