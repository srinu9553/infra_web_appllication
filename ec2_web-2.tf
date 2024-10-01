resource "aws_instance" "web-1b" {
  ami                        = "ami-0522ab6e1ddcc7055"
  instance_type              = "t2.micro"
  availability_zone          = "ap-south-1b"
  associate_public_ip_address= "true"
  key_name                   = "ap-south-a_key"
  security_groups            = [aws_security_group.ssh.id]
  subnet_id                  = aws_subnet.web-1b.id
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "<html><h1>Hello from Apache on EC2!</h1></html>" > /var/www/html/index.html
  EOF
  tags = {
    Name = "web-server-1b"
  }
    
  }
