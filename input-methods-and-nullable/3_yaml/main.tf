module "yaml_1_nullable_set" {
  source = "../module"

  for_each = { for i, o in local.yaml_merged_1_w_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "yaml_2_not_nullable_set" {
  source = "../module"

  for_each = { for i, o in local.yaml_merged_2_w_null : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "yaml_3_all_set" {
  source = "../module"

  for_each = { for i, o in local.yaml_merged_3_w_lookup_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "yaml_4_none_set" {
  source = "../module"

  for_each = { for i, o in local.yaml_merged_4_w_lookup_null : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}
