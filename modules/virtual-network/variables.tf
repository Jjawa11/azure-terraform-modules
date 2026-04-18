variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "australiaeast"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name             = string
    address_prefixes = list(string)
    create_nsg       = bool
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
