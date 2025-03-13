output "vm_public_ip" {
  value       = azurerm_public_ip.public_ip.ip_address
  description = "The public IP address of the virtual machine"
}

output "vm_name" {
  value       = azurerm_linux_virtual_machine.vm.name
  description = "The name of the virtual machine"
}

output "admin_username" {
  value       = azurerm_linux_virtual_machine.vm.admin_username
  description = "The admin username of the virtual machine"
}

output "ssh_command" {
  value       = "ssh ${azurerm_linux_virtual_machine.vm.admin_username}@${azurerm_public_ip.public_ip.ip_address}"
  description = "Command to SSH into the virtual machine"
}

output "vm_fqdn" {
  value       = azurerm_public_ip.public_ip.fqdn
  description = "The FQDN of the virtual machine (if configured)"
  sensitive   = false
}

output "vm_private_ip" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "The private IP address of the virtual machine"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group"
}