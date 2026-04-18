# azure-terraform-modules

> Reusable, production-ready Terraform modules for Azure infrastructure deployments.

Built from real-world experience delivering Azure solutions across enterprise environments — including AVD deployments, healthcare migrations, and CIS-hardened landing zones.

---

## Modules

| Module | Description |
|--------|-------------|
| [`resource-group`](./modules/resource-group) | Standardised Azure Resource Group with tagging |
| [`virtual-network`](./modules/virtual-network) | VNet with configurable subnets and NSGs |
| [`key-vault`](./modules/key-vault) | Key Vault with RBAC, soft delete, and purge protection |
| [`storage-account`](./modules/storage-account) | Storage account with lifecycle policies |
| [`log-analytics`](./modules/log-analytics) | Log Analytics Workspace for centralised monitoring |

---

## Usage

```hcl
module "resource_group" {
  source   = "./modules/resource-group"
  name     = "rg-prod-australiaeast"
  location = "australiaeast"
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
```

---

## Prerequisites

- Terraform >= 1.3
- AzureRM Provider >= 3.0
- Azure CLI authenticated (`az login`)

---

## Structure

```
azure-terraform-modules/
├── modules/
│   ├── resource-group/
│   ├── virtual-network/
│   ├── key-vault/
│   ├── storage-account/
│   └── log-analytics/
├── examples/
│   └── basic-landing-zone/
└── README.md
```

---

## Author

**Jayant Jawa** — Senior Azure Cloud Engineer
Melbourne, Australia
Certifications: AZ-104 | AZ-305 | AZ-303 | SC-900 | GitHub Foundations | GitHub Copilot

---

## License

MIT
