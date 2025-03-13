# Variables à remplir avant de lancer Terraform

variable "subscription_id" {
  description = "ID de l'abonnement Azure"
  type        = string
  default     = ""
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé SSH publique"
  type        = string
  default     = ""
}

# Variables fixes

variable "location" {
  description = "Emplacement de la ressource"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "ubuntu-rg"
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur pour la VM"
  type        = string
  default     = "adminuser"
}

variable "os_image" {
  description = "Image du système d'exploitation"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "storage_account_type" {
  description = "Type de stockage"
  type        = string
  default     = "Standard_LRS"
}

variable "vm_size" {
  description = "Taille de la machine virtuelle"
  type        = string
  default     = "Standard_B1ls"
}