# New way of doing it with cross object validation

variable "use_custom_name" {
  default     = false
  description = "Use if you want a custom name for the resource"
  type        = bool
}

# Does not allow "" for custom_name when use_custom_name is true
variable "custom_name" {
  default     = ""
  description = "Custom name for the resource"
  type        = string

  validation {
    condition     = var.use_custom_name ? can(regex("^[A-Za-z0-9]{2,10}$", var.custom_name)) : true
    error_message = "custom_name must be set when use_custom_name is true. If set it must only contain letters and numbers between 2-10 characters."
  }
}

variable "custom_name_prefix" {
  default     = ""
  description = "Prefix for the custom name"
  type        = string

  validation {
    condition     = var.use_custom_name ? (can(regex("^[A-Za-z]{2,4}$", var.custom_name_prefix))) || var.custom_name_prefix == "" : true
    error_message = "custom_name_prefix can be set when use_custom_name is true. If set it must only contain letters between 2-4 characters."
  }
}
