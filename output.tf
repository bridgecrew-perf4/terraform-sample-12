output "test_name" {
  value = "test value"
}

output "public_dns" {
  value = aws_instance.default.public_dns
}