
/*
resource "aws_route53_zone" "example" {
  name = "ranjithdevops.org.in"  # Replace with your actual domain name
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.example.id
  name     = "ranjithdevops.org.in"  # Change as needed
  type     = "A"  # Use "CNAME" if pointing to another domain

  alias {
    name                   = aws_lb.web_lb.dns_name
    zone_id                = aws_lb.web_lb.zone_id
    evaluate_target_health = true
  }
}

*/




