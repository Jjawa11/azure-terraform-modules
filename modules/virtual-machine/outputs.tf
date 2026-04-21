output "vm_id" {
  description = "The ID of the virtual machine"
  value       = var.os_type == "linux" ? azurerm_linux_virtual_machine.this[0].id : azurerm_windows_virtual_machine.this[0].id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = var.os_type == "linux" ? azurerm_linux_virtual_machine.this[0].name : azurerm_windows_virtual_machine.this[0].name
}

output "private_ip_address" {
  description = "The private IP address of the VM"
  value       = azurerm_network_interface.this.private_ip_address
}

output "public_ip_address" {
  description = "The public IP address of the VM (if created)"
  value       = var.create_public_ip ? azurerm_public_ip.this[0].ip_address : null
}

output "nic_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}
