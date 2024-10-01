resource "aws_lb_target_group" "web-target-group" {
  name     = "web-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test.id
}

# Data source to get running instances with a specific tag
data "aws_instances" "running_instances" {
  
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

# Attach instances to the target group
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.web-target-group.arn
  target_id        = aws_instance.web-1a.id
  port             = 80
}


# Attach instances to the target group
resource "aws_lb_target_group_attachment" "test-1" {
  target_group_arn = aws_lb_target_group.web-target-group.arn
  target_id        = aws_instance.web-1b.id
  port             = 80
}



resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}