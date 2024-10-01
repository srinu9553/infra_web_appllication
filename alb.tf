
resource "aws_lb" "web_lb" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  
  security_groups = [aws_security_group.sg_lb.id]
  
  subnets = [
    aws_subnet.web-1a.id,
    aws_subnet.web-1b.id,
  ]
  enable_deletion_protection = false
  
}

# Security Group Example (optional)
resource "aws_security_group" "sg_lb" {
  name        = "allow_http_https"
  description = "Allow HTTP and HTTPS"
  vpc_id      = aws_vpc.test.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {
    from_port   = -1  # All ICMP
    to_port     = -1  # All ICMP
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]  # Change this for more restricted access
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name= "sg-lb"
  }
}

  
