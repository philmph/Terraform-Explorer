# tf-1.9.x-variable-validation

The interesting code is found in the [`variables_new.tf`](./variables_new.tf) file.

To test this locally, run `terraform init` and play around with the simple toggles in [`terraform.tfvars`](./terraform.tfvars).

## Notes

### Default values for cross variable validation

A `default` value needs to be set to the default value for a given type (f.e. `""` for string).

If not, it will be required since on `terraform plan / apply` since this is behaviour is not related to the `validation` block.

If you want f.e. `""` to be allowed for a given variable `test` add `|| var.test == ""` to the validation block. Also seen in the example variable `custom_name_prefix`.
