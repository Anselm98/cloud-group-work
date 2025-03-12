# Public instance in the public subnet
resource "aws_instance" "nginx_server" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.public.id
  
# Put your ssh key  key_name               = ""
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              
              # Create custom HTML page
              cat > /var/www/html/index.html <<'HTMLEOF'
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Les Zoukeurs</title>
              </head>
              <body>
                  <h1>Bienvenue !</h1>
                  <p>Ici ça zouk fort</p>
              </body>
              </html>
              HTMLEOF
              EOF
  
  tags = {
    Name = var.instance_name
  }
}

# Private instance in the private subnet
resource "aws_instance" "private_instance" {
  ami                    = var.image_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  subnet_id              = aws_subnet.private.id
# Put your ssh key  key_name               = ""
  
  tags = {
    Name = "${var.instance_name}-private"
  }
}