
# Note: Doesn't work because random_string will only be known after apply -> Needs command = apply
run "validate_storage_account_name" {
  # command = plan
  command = apply

  assert {
    condition     = length(azurerm_storage_account.this.name) == 24
    error_message = "The length of the Storage Account name should be 24 characters."
  }

  assert {
    condition     = length(regexall("^st${var.name}[0-9a-z]*$", azurerm_storage_account.this.name)) > 0
    error_message = "Name should start with 'st' followed by the value of var.name and end with random numbers or lowercase characters."
  }
}
