variable "name" {
  description = "The name of the Log Analytics Workspace"
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

variable "sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Data retention period in days (30-730)"
  type        = number
  default     = 30
}

variable "solutions" {
  description = "List of Log Analytics solutions to deploy"
  type = list(object({
    name      = string
    publisher = string
    product   = string
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
