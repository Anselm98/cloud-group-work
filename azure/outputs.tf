output "public_ip" {
  description = "Adresse IP publique de la machine virtuelle"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "vm_name" {
  description = "Nom de la machine virtuelle"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "ssh_command" {
  description = "Commande SSH pour se connecter à la VM"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.public_ip.ip_address}"
}
