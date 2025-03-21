locals {
  yaml1 = yamldecode(file("${path.root}/yaml.yaml"))

  defaults_for_yaml_1 = {
    nullable     = "merge-default"
    not_nullable = "merge-default"
  }

  defaults_for_yaml_2 = {
    nullable     = null
    not_nullable = null
  }

  yaml1_merged_1 = [for i, o in local.yaml1.input : merge(local.defaults_for_yaml_1, o)]

  # Preferred to be able to use module default values and keeping it readable
  # Note that multi-layer objects do not work with merges like this
  yaml1_merged_2 = [for i, o in local.yaml1.input : merge(local.defaults_for_yaml_2, o)]
}
