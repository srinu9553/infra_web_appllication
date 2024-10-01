resource "aws_instance" "web-1a" {
  ami                        = "ami-0522ab6e1ddcc7055"
  instance_type              = "t2.micro"
  availability_zone          = "ap-south-1a"
  associate_public_ip_address= "true"
  key_name                   = "ap-south-a_key"
  security_groups            = [aws_security_group.ssh.id]
  subnet_id                  = aws_subnet.web.id
  
  
  tags = {
    Name = "web-server-1a"
  }
    
  }
