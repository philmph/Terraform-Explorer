locals {
  yaml = yamldecode(file("${path.root}/yaml.yaml"))

  defaults_for_yaml_merged_1 = {
    nullable     = "merge-default"
    not_nullable = "merge-default"
  }

  yaml_merged_1_w_defaults = [for i, o in local.yaml.input : merge(local.defaults_for_yaml_merged_1, o)]

  defaults_for_yaml_merged_2 = {
    nullable     = null
    not_nullable = null
  }

  # ! May be breaking if module doesn't use nullable = false
  # Preferred to be able to use module default values and keeping it readable
  # Note that multi-layer objects do not work with merges like this
  yaml_merged_2_w_null = [for i, o in local.yaml.input : merge(local.defaults_for_yaml_merged_2, o)]

  yaml_merged_3_w_lookup_defaults = [for i, o in local.yaml.input :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", "lookup-default")
      not_nullable = lookup(o, "not_nullable", "lookup-default")
    }
  ]

  yaml_merged_4_w_lookup_null = [for i, o in local.yaml.input :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", null)
      not_nullable = lookup(o, "not_nullable", null)
    }
  ]
}
