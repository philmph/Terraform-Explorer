locals {
  yaml_directory = "config"

  # Working version
  yaml_filename = "input.yaml"

  # Fails for :19 -> No key .input exists; not very user friendly
  # yaml_filename = "wrong_input1.yaml"

  # Fails for :19 -> No key .name exists (without reference for the object); not very user friendly
  # yaml_filename = "wrong_input2.yaml"
  yaml_data = yamldecode(file("${path.root}/../${local.yaml_directory}/${local.yaml_filename}"))
}

# Doesn't model the whole yaml and needs for_each pointing to a list entry point
module "yaml_validation" {
  source = "./yaml_validation"

  for_each = { for k, v in local.yaml_data.input : v.name => v }

  input = each.value
}

locals {
  yaml_output = { for k, v in module.yaml_validation : k => v.output }
}
