locals {
  nested_object = {
    key1 = {
      key2 = {
        key3 = [
          "list1", "list2", "list3", "list4"
        ]
        key4 = [
          "list5", "list6", "list7", "list8"
        ]
      }
    }
  }
  format1 = flatten([for k, v in local.nested_object :
    [for k1, v1 in v :
      [for i, o in v1 :
        {
          key1          = k
          key2          = k1
          key3_iterator = i
          key3_object   = o
        }
      ]
    ]
  ])

  format2 = flatten(
    [for k, v in local.nested_object :
      [for k1, v1 in v :
        [for i, o in v1 :
          { key1          = k
            key2          = k1
            key3_iterator = i
            key3_object   = o
          }
        ]
      ]
    ]
  )

  format3 = flatten([for k, v in local.nested_object : [
    for k1, v1 in v : [
      for i, o in v1 : {
        key1          = k
        key2          = k1
        key3_iterator = i
        key3_object   = o
  }]]])

  format4 = flatten(
    [for k, v in local.nested_object :
      [for k1, v1 in v :
        [for i, o in v1 :
          {
            key1          = k
            key2          = k1
            key3_iterator = i
            key3_object   = o
          }
  ]]])
}
