variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  type        = string
  default     = "cloudgroupwork-rg"
}

variable "location" {
  description = "Emplacement de la ressource"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur pour la VM"
  type        = string
  default     = "admin"
}

variable "vm_size" {
  description = "Taille de la machine virtuelle"
  type        = string
  default     = "Standard_B1s"
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé SSH publique"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "tags" {
  description = "Tags à appliquer aux ressources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "CloudGroupWork"
  }
}