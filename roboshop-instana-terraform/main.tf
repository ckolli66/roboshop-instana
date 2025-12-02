resource "aws_instance" "instances" {
  for_each = var.instances
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "records" {
  for_each = var.instances
  zone_id = var.zone_id
  name    = "${each.key}-dev"
  type    = "A"
  ttl     = 5
  records = [aws_instance.instances[each.key].private_ip]
}

