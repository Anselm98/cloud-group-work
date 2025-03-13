# Projet d'Infrastructure Cloud

Ce dépôt contient des configurations d'Infrastructure as Code (IaC) pour déployer des ressources cloud sur AWS et Azure avec Terraform.


## Infrastructure AWS

La configuration AWS déploie une infrastructure complète d'application web avec :

- VPC avec sous-réseaux publics et privés
- Instances EC2 (serveur web en sous-réseau public, instance privée en sous-réseau privé)
- ACL réseau et groupes de sécurité
- NAT Gateway pour l'accès Internet du sous-réseau privé
- Instance de base de données RDS MariaDB
- Bucket S3 pour le stockage

Le serveur web exécute NGINX et sert une page HTML simple. Un zoukeur s'est caché dans la page web, sauras-tu le retrouver ?

## Infrastructure Azure

La configuration Azure déploie :

- Groupe de ressources
- Réseau virtuel avec sous-réseau
- Machine Virtuelle avec IP publique
- Serveur web NGINX

## Prérequis

- [Terraform](https://www.terraform.io/downloads.html) installé
- AWS CLI configuré avec des identifiants valides pour le déploiement AWS
- Azure CLI configuré avec des identifiants valides pour le déploiement Azure
- Paire de clés SSH pour accéder aux machines virtuelles

## Utilisation

### Déploiement AWS

1. Accédez au répertoire AWS :

   ```
   cd aws
   ```

2. Mettez à jour les variables dans `variable.tf` ou créez un fichier `terraform.tfvars` avec vos valeurs.

3. Initialisez Terraform :
   ```
   terraform init
   ```

4. Vérifiez le plan :
   ```
   terraform plan
   ```

5. Appliquez la configuration : 
   ```
   terraform apply
   ```


### Déploiement Azure

1. Accédez au répertoire Azure :
   ```
   cd azure
   ```

2. Créez un fichier `terraform.tfvars` avec vos identifiants Azure et valeurs de configuration.

3. Initialisez Terraform :
   ```
   terraform init
   ```

4. Vérifiez le plan : 
   ```
   terraform plan
   ```

5. Appliquez la configuration :
   ```
   terraform apply
   ```


## Notes 

- Les mot de passe par défaut ainsi que clés SSH doivent être modifiés dans `variable.tf`

## Sorties

Après le déploiement, diverses sorties sont fournies incluant :
- Adresses IP publiques
- IDs des instances
- Points de terminaison de base de données
