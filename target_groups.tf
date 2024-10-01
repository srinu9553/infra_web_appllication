resource "aws_lb_target_group" "web-target-group" {
  name     = "web-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.test.id
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = 80
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}