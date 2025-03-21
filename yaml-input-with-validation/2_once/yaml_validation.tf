locals {
  yaml_directory = "config"

  # Working version
  yaml_filename = "input.yaml"

  # Fails for :21 -> Writes out proper error message highlighting what is missing
  # attribute "input" is required
  # yaml_filename = "wrong_input1.yaml"

  # Fails for :21 -> Writes out proper error message highlighting what is missing
  # attribute "input": element 4: attribute "name" is required
  # yaml_filename = "wrong_input2.yaml"
  yaml_data = yamldecode(file("${path.root}/../${local.yaml_directory}/${local.yaml_filename}"))
}

# 1:1 modelling of the yaml schema. Way superior to the loop model (opinion)
module "yaml_validation" {
  source = "./yaml_validation"

  input = local.yaml_data
}

locals {
  yaml_output = { for i, o in module.yaml_validation.output.input : o.name => o }
}
