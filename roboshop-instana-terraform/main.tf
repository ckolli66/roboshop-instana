resource "aws_instance" "instances" {
  count = 10
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_route53_record" "records" {
  count = 10
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}-dev"
  type    = "A"
  ttl     = 5
  records = [aws_instance.instances[count.index].private_ip]
}

