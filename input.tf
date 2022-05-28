#variable "create_image_version" {
#  type        = bool
#  description = "Whether the for_each block for an image version is to be executed"
#  default     = false
#}

variable "images" {
  type        = any
  description = "The images block"
}

variable "location" {
  description = "The location for this resource to be put in"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource group name is not valid."
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}
