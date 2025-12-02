variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.small"
}

variable "vpc_security_group_ids" {
  default = [ "sg-099eff6e665cecd4a" ]
}

variable "zone_id" {
  default = "Z06404431NXHJ1IDZF7W2"
}

variable "instances" {
  default = {
    frontend = " "
    mongodb = " "
    catalogue = " "
    redis = " "
    user = " "
    cart = " "
    shipping = " "
    payment = " "
    mysql = " "
    rabbitmq = " "
  }
}