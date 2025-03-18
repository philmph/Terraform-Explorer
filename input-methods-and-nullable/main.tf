module "input1" {
  source = "./module"

  for_each = { for i, o in var.input1 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "input2_w_defaults" {
  source = "./module"

  for_each = { for i, o in var.input2_w_defaults : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals1" {
  source = "./module"

  for_each = { for i, o in local.locals1_merged_1 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals2" {
  source = "./module"

  for_each = { for i, o in local.locals1_merged_2 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals3" {
  source = "./module"

  for_each = { for i, o in local.locals1_merged_3 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}

module "locals4" {
  source = "./module"

  for_each = { for i, o in local.locals1_merged_4 : o.name => o }

  nullable     = each.value.nullable
  not_nullable = each.value.not_nullable
}
