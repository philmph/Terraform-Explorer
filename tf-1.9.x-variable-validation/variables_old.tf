# Old way of doing it

# Option A: We provide a default value for custom_name_old which fits the regex
# This allows the user to omit the variable which we actually don't want to allow
variable "custom_name_old_a" {
  default     = "Legit"
  description = "Custom name for the resource"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9]{2,10}$", var.custom_name_old_a))
    error_message = "custom_name_old_a must be 2-10 characters long."
  }
}

# Option B: We allow default "" for custom_name_old and deal with the case that it left as "" in main.tf
# This allows the user to omit the variable which we actually don't want to allow
variable "custom_name_old_b" {
  default     = ""
  description = "Custom name for the resource"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9]{2,10}$", var.custom_name_old_b)) || var.custom_name_old_b == ""
    error_message = "custom_name_old_b must be 2-10 characters long."
  }
}
