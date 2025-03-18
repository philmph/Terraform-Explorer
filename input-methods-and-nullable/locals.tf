locals {
  defaults_for_locals_1 = {
    nullable     = "merge-default"
    not_nullable = "merge-default"
  }

  defaults_for_locals_2 = {
    nullable     = null
    not_nullable = null
  }

  locals1 = [
    {
      name     = "locals1_1"
      nullable = "input"
    },
    {
      name         = "locals1_2"
      not_nullable = "input"
    },
    {
      name         = "locals1_3"
      nullable     = "input"
      not_nullable = "input"
    },
    {
      name = "locals1_4"
    }
  ]

  locals1_merged_1 = [for i, o in local.locals1 : merge(local.defaults_for_locals_1, o)]

  # Preferred to be able to use module default values and keeping it readable
  locals1_merged_2 = [for i, o in local.locals1 : merge(local.defaults_for_locals_2, o)]

  locals1_merged_3 = [for i, o in local.locals1 :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", "lookup")
      not_nullable = lookup(o, "not_nullable", "lookup")
    }
  ]

  locals1_merged_4 = [for i, o in local.locals1 :
    {
      name         = o.name
      nullable     = lookup(o, "nullable", null)
      not_nullable = lookup(o, "not_nullable", null)
    }
  ]
}
