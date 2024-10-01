resource "aws_instance" "web-1a" {
  ami                        = "ami-0522ab6e1ddcc7055"
  instance_type              = "t2.micro"
  availability_zone          = "ap-south-1a"
  associate_public_ip_address= "true"
  key_name                   = "ap-south-a_key"
  security_groups            = [aws_security_group.ssh.id]
  subnet_id                  = aws_subnet.web-1a.id
  
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "<html><h1>HELLO WE ARE TESTING LB WORKING OR NOT </h1></html>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "web-server-1a"
  }
    
  }
