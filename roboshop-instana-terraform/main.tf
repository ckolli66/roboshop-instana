resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-099eff6e665cecd4a" ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z06404431NXHJ1IDZF7W2"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 5
  records = [aws_instance.frontend.private_ip]
}