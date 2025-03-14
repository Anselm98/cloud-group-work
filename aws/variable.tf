variable "key_name" {
  description = "Nom de la clé publique SSH sur AWS"
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "Nom du bucket S3"
  type        = string
  default     = ""  
}

variable "aws_region" {
  description = "La region ou sa va zouker"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "l'instance EC2 du zouk"
  type        = string
  default     = "t2.nano"
}

variable "instance_name" {
  description = "le nom des EC2 qui savent zouker"
  type        = string
  default     = "nginx-server-terraform"
}

variable "image_ami" {
  description = "l'ami des zoukeurs"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"
}

variable "db_password" {
  description = "Password base de données"
  type        = string
  default     = "CHANGEME"
}