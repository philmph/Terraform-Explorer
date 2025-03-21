module "yaml1" {
  source = "../module"

  for_each = { for i, o in local.yaml1_merged_1 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "yaml2" {
  source = "../module"

  for_each = { for i, o in local.yaml1_merged_2 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}
