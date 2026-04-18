variable "name" {
  description = "The name of the storage account (3-24 chars, lowercase alphanumeric)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "australiaeast"
}

variable "account_tier" {
  description = "The tier of the storage account (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type (LRS, GRS, RAGRS, ZRS)"
  type        = string
  default     = "LRS"
}

variable "blob_soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted blobs"
  type        = number
  default     = 7
}

variable "container_soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted containers"
  type        = number
  default     = 7
}

variable "enable_lifecycle_rule" {
  description = "Enable blob lifecycle management rule"
  type        = bool
  default     = false
}

variable "tier_to_cool_after_days" {
  description = "Days after which blobs are tiered to cool storage"
  type        = number
  default     = 30
}

variable "tier_to_archive_after_days" {
  description = "Days after which blobs are tiered to archive storage"
  type        = number
  default     = 90
}

variable "delete_after_days" {
  description = "Days after which blobs are deleted"
  type        = number
  default     = 365
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
