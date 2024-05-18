variable "function_name" {
  type = string
  description = "name of the function"
}

# This should be an input variable for the module
variable "function_description" {
  type = string
  description = "The description of the function"
  
  default = "This is an auto-generated description"
}