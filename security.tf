# Web server security group
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Autorise HTTP et SSH  pour les serveurs web"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Autorise tout le traffic sortant"
  }

  tags = {
    Name = "web-sg"
  }
}

# Private instance security group
resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Security group pour les instances privees"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
    description     = "SSH depuis le subnet publique"
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Autorise tout le traffic sortant"
  }
  
  tags = {
    Name = "private-sg"
  }
}

# Database security group
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Security group pour les databases"
  vpc_id      = aws_vpc.main.id

  # MariaDB/MySQL standard port - allow from web server
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
    description     = "MariaDB acces depuis les serveurs web"
  }

  # MariaDB/MySQL standard port - allow from anywhere
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "MariaDB acces depuis Internet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Autorise tout le traffic sortant"
  }

  tags = {
    Name = "db-sg"
  }
}