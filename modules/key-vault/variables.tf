variable "name" {
  description = "The name of the Key Vault"
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

variable "sku_name" {
  description = "The SKU of the Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted objects"
  type        = number
  default     = 90
}

variable "purge_protection_enabled" {
  description = "Enable purge protection on the Key Vault"
  type        = bool
  default     = true
}

variable "enable_rbac_authorization" {
  description = "Enable RBAC authorization instead of access policies"
  type        = bool
  default     = true
}

variable "network_default_action" {
  description = "Default network action (Allow or Deny)"
  type        = string
  default     = "Deny"
}

variable "network_ip_rules" {
  description = "List of allowed IP rules"
  type        = list(string)
  default     = []
}

variable "role_assignments" {
  description = "List of RBAC role assignments for the Key Vault"
  type = list(object({
    principal_id         = string
    role_definition_name = string
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to apply to resources"
  type        = map(string)
  default     = {}
}
