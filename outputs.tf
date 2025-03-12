output "nginx_public_ip" {
  value       = aws_instance.nginx_server.public_ip
  description = "The public IP address of the nginx server"
}

output "nginx_instance_id" {
  value       = aws_instance.nginx_server.id
  description = "ID de l'instance nginx"
}

output "private_instance_id" {
  value       = aws_instance.private_instance.id
  description = "ID de l'instance privée"
}

output "private_instance_private_ip" {
  value       = aws_instance.private_instance.private_ip
  description = "L'adresse IP privée de l'instance privée"
}

output "nat_gateway_public_ip" {
  value       = aws_nat_gateway.nat.public_ip
  description = "L'adresse IP publique de la passerelle NAT"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "L'ID du VPC"
}

output "webserver_domain_name" {
  value       = aws_instance.nginx_server.public_dns
  description = "Nom de domaine de l'instance nginx"  
}

output "rds_endpoint" {
  value       = aws_db_instance.db.endpoint
  description = "Point de terminaison de la base de données RDS"
}