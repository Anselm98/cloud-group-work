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
              
              mkdir -p /var/www/html/images
              wget -O /var/www/html/images/zouk-background.jpeg "https://i.discogs.com/aWA90NFnD68p82qzDKIvUECpZ9A4twRTbMOf396zkfo/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIwNzQ0/MTItMTI2MjU1NTYw/OC5qcGVn.jpeg"
              
              cat > /var/www/html/index.html <<'HTMLEOF'
              <!DOCTYPE html>
              <html>
              <head>
                  <title>Les Zoukeurs</title>
                  <style>
                      body {
                          background-image: url('images/zouk-background.jpeg');
                          background-size: cover;
                          background-repeat: no-repeat;
                          background-attachment: fixed;
                          color: white;
                          text-shadow: 2px 2px 4px #000000;
                          font-family: Arial, sans-serif;
                          margin: 0;
                          padding: 0;
                          height: 100vh;
                          display: flex;
                          flex-direction: column;
                          justify-content: center;
                          align-items: center;
                      }
                      h1 {
                          font-size: 3em;
                      }
                      p {
                          font-size: 1.5em;
                      }
                  </style>
              </head>
              <body>
                  <h1>Bienvenue !</h1>
                  <p>Ici on zouk fort</p>
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

resource "aws_s3_bucket" "zoukbucket" {
  bucket = "zoukbucket"
}