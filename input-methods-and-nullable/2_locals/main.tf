module "locals_merged_1_w_defaults" {
  source = "../module"

  for_each = { for i, o in local.locals_merged_1_w_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals_merged_2_w_null" {
  source = "../module"

  for_each = { for i, o in local.locals_merged_2_w_null : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals_merged_3_w_lookup_defaults" {
  source = "../module"

  for_each = { for i, o in local.locals_merged_3_w_lookup_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals_merged_4_w_lookup_null" {
  source = "../module"

  for_each = { for i, o in local.locals_merged_4_w_lookup_null : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}
