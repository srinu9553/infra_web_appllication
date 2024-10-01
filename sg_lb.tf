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
  tags = {
    name= "sg-lb"
  }
}

