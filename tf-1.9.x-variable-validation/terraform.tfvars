# Toggle comments to test the difference

# Fails because custom_name is not set
# use_custom_name = true

# Works if enabled
# custom_name        = "Okay"
# custom_name_prefix = "Ok"

# Outputs:
# name = "Ok-Okay"

# Doesn't work because illegal regex match
# custom_name        = "IContainTooManyCharacters"
# custom_name_prefix = "IAlsoContainTooManyCharacters"

# Outputs:
# Planning failed. Terraform encountered an error while generating this plan.

# ╷
# │ Error: Invalid value for variable
# │
# │   on terraform.tfvars line 15:
# │   15: custom_name        = "IContainTooManyCharacters"
# │     ├────────────────
# │     │ var.custom_name is "IContainTooManyCharacters"
# │     │ var.use_custom_name is true
# │
# │ custom_name must be set when use_custom_name is true. If set it must only contain letters and numbers between 2-10 characters.
# │
# │ This was checked by the validation rule at variables_new.tf:15,3-13.
# ╵
# ╷
# │ Error: Invalid value for variable
# │
# │   on terraform.tfvars line 16:
# │   16: custom_name_prefix = "IAlsoContainTooManyCharacters"
# │     ├────────────────
# │     │ var.custom_name_prefix is "IAlsoContainTooManyCharacters"
# │     │ var.use_custom_name is true
# │
# │ custom_name_prefix can be set when use_custom_name is true. If set it must only contain letters between 2-4 characters.
# │
# │ This was checked by the validation rule at variables_new.tf:26,3-13.
# ╵
