output "public_ip" {
  description = "Adresse IP publique de la machine virtuelle"
  value       = azurerm_public_ip.public_ip.ip_address
}
