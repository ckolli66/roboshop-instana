variable "count_example"{
  count = 10
  default = 1
}

output "count" {
  value = var.count_example
}