locals {
  locals = [
    {
      name     = "locals_1_nullable_set"
      nullable = "input"
    },
    {
      name         = "locals_2_not_nullable_set"
      not_nullable = "input"
    },
    {
      name         = "locals_3_all_set"
      nullable     = "input"
      not_nullable = "input"
    },
    {
      name = "locals_4_none_set"
    }
  ]

  defaults_for_locals_merged_1 = {
    nullable     = "merge-default"
    not_nullable = "merge-default"
  }

  locals_merged_1_w_defaults = [for i, o in local.locals : merge(local.defaults_for_locals_merged_1, o)]

  defaults_for_locals_merged_2 = {
    nullable     = null
    not_nullable = null
  }

  # ! May be breaking if module doesn't use nullable = false
  # Preferred to be able to use module default values and keeping it readable
  # Note that multi-layer objects do not work with merges like this
  locals_merged_2_w_null = [for i, o in local.locals : merge(local.defaults_for_locals_merged_2, o)]

  locals_merged_3_w_lookup_defaults = [for i, o in local.locals :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", "lookup-default")
      not_nullable = lookup(o, "not_nullable", "lookup-default")
    }
  ]

  locals_merged_4_w_lookup_null = [for i, o in local.locals :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", null)
      not_nullable = lookup(o, "not_nullable", null)
    }
  ]
}
