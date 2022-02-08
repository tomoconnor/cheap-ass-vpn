resource "aws_security_group" "allow_vpn_traffic" {
  name        = "allow_vpn_traffic"
  description = "Allow VPN inbound traffic"
  vpc_id      = data.aws_vpc.this.id

  tags = {
    Name = "Allow-VPN-Traffic"
  }
}

resource "aws_security_group_rule" "ssh_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "SSH-In"
}

resource "aws_security_group_rule" "isakmp_in" {
  type              = "ingress"
  from_port         = 500
  to_port           = 500
  protocol          = "udp"
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "ISAKMP-In"
}
resource "aws_security_group_rule" "nat_t_in" {
  type              = "ingress"
  from_port         = 4500
  to_port           = 4500
  protocol          = "udp"
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "NAT-T-In"
}


resource "aws_security_group_rule" "esp_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = 50
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "ESP-In"
}

resource "aws_security_group_rule" "ah_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = 51
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "AH-In"
}

resource "aws_security_group_rule" "isakmp_out" {
  type              = "egress"
  from_port         = 500
  to_port           = 500
  protocol          = "udp"
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "ISAKMP-Out"
}

resource "aws_security_group_rule" "esp_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = 50
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "ESP-Out"
}

resource "aws_security_group_rule" "ah_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = 51
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "AH-Out"
}

resource "aws_security_group_rule" "https_out" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "HTTPS-Out"
}

resource "aws_security_group_rule" "http_out" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "HTTP-Out"
}

resource "aws_security_group_rule" "nat_t_out" {
  type              = "egress"
  from_port         = 4500
  to_port           = 4500
  protocol          = "udp"
  cidr_blocks       = [var.allow_list_ipv4_prefix]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "NAT-T-Out"
}

resource "aws_security_group_rule" "all_out_to_vpc" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [data.aws_vpc.this.cidr_block]
  security_group_id = aws_security_group.allow_vpn_traffic.id
  description       = "All Traffic out to VPC"
}