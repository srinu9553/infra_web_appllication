
resource "aws_lb" "web_lb" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  
  security_groups = [aws_security_group.sg_lb.id]
  
  subnets = [
    aws_subnet.web.id,
    aws_subnet.web-2.id,
  ]
  enable_deletion_protection = false
  
}

