

module "endpoint_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${local.aws_global_level_id}-vpn"

  ami                    = var.vpn_ami_id
  instance_type          = var.instance_type
  key_name               = data.aws_key_pair.access.key_name
  monitoring             = false
  vpc_security_group_ids = [resource.aws_security_group.allow_vpn_traffic.id]
  subnet_id              = var.subnet_id
  source_dest_check      = false
  tags                   = local.default_tags
  disable_api_termination = true
}
