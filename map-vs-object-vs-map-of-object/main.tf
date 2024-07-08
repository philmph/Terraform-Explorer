# In a map, all values must be of the same type
variable "map" {
  default = {
    key1 = "value1"
    key2 = "value2"
  }
  type = map(string)
}

# Object allows values to be of different types
variable "object" {
  default = {
    key1 = "value"
    key2 = 42
  }
  type = object({
    key1 = string
    key2 = number
  })
}

# Map of object forces all values to be the defined object
# Just like map of string forces all values to be string
variable "map_of_object" {
  default = {
    map1 = {
      key1 = "value1"
      key2 = 42
    }
    map2 = {
      key1 = "value2"
      key2 = 42
    }
  }
  type = map(object({
    key1 = string
    key2 = number
  }))
}
