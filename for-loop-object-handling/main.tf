locals {
  object = {
    key1 = "value1"
    key2 = "value2"
  }

  # Full typed loop
  object_loop_fully_typed = [for key, value in local.object : "key=${key}, value=${value}"]

  # Providing only one variable will default to the value
  object_loop_omit = [for value in local.object : "value=${value}"]

  # Using _ does not /dev/null like in go, _ is still usable
  object_loop_using_ = [for _, value in local.object : "key=${_}, value=${value}"]

  # Opinionated valid use case: Only wanting the key but indicating (to humans) that the value is not used
  object_loop_key_only = [for key, _ in local.object : "key=${key}, I am still usable=${_}"]

  # Using key only results in key being the value as also seen in the object_loop_omit
  object_loop_key_wrongfully_expected = [for key in local.object : "I am actually the value=${key}"]

  tuple = [
    "value1",
    "value2",
  ]

  # Full typed loop
  tuple_loop_fully_typed = [for iterator, obj in local.tuple : "iterator=${iterator}, obj=${obj}"]

  # Providing only one variable will default to the object
  tuple_loop_omit = [for obj in local.tuple : "obj=${obj}"]

  # Using _ does not /dev/null like in go, _ is still usable
  tuple_loop_using_ = [for _, obj in local.tuple : "iterator=${_}, obj=${obj}"]

  # Structures below are not used because they behave the same as the default assignments object = {} and tuple = []
  map = tomap({
    key1 = "value1"
    key2 = "value2"
  })

  list = tolist([
    "value1",
    "value2",
  ])

  set = toset([
    "value1",
    "value2",
  ])
}
