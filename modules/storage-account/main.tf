terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"
  https_traffic_only_enabled = true

  blob_properties {
    delete_retention_policy {
      days = var.blob_soft_delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_soft_delete_retention_days
    }
  }

  lifecycle_rule {
    name    = "auto-tier"
    enabled = var.enable_lifecycle_rule

    filters {
      blob_types = ["blockBlob"]
    }

    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = var.tier_to_cool_after_days
        tier_to_archive_after_days_since_modification_greater_than = var.tier_to_archive_after_days
        delete_after_days_since_modification_greater_than          = var.delete_after_days
      }
    }
  }

  tags = var.tags
}
