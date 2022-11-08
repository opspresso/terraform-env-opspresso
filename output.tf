# output

output "www" {
  value = format("https://www.%s", var.domain)
}
