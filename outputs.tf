output "rsa_key_pair_id" {
  value = data.aws_key_pair.access.id
}

output "endpoint_eip" {
    value = aws_eip.endpoint.public_ip
  
}