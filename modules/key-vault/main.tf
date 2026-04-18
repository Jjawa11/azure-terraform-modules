terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled
  enable_rbac_authorization   = var.enable_rbac_authorization

  network_acls {
    bypass         = "AzureServices"
    default_action = var.network_default_action
    ip_rules       = var.network_ip_rules
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "this" {
  for_each = { for ra in var.role_assignments : "${ra.principal_id}-${ra.role_definition_name}" => ra }

  scope                = azurerm_key_vault.this.id
  role_definition_name = each.value.role_definition_name
  principal_id         = each.value.principal_id
}
