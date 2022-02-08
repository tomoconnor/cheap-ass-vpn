resource "aws_eip" "endpoint" {
  instance = module.endpoint_server.id
  vpc      = true
  tags = merge(local.default_tags,
    { Name = "${var.component}-EIP"},
  )
}

