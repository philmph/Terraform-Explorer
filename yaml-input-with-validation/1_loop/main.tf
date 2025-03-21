module "module_call" {
  source = "../module"

  for_each = local.yaml_output

  nullable     = each.value.config.nullable
  not_nullable = each.value.config.not_nullable
}
