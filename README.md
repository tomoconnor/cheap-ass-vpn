# cheap-ass-vpn
Terraform Module for creating a really cheap VPN solution on AWS

## Variables
* `aws_region` - Set this to your current region (the provider in this module uses it.  You can probably refactor it out)
* `project` - Project and Environment tags are used by Locals for construction of object naming/tags
* `environment` - See above
* `vpc_id` - VPC to deploy cheap-ass-VPN into
* `subnet_id` - Public Subnet to deploy the endpoint into.
* `vpn_ami_id` - AMI ID of an image with Strongswan configured. (out of scope for this repo, because it's so bloody fiddly.)
* `allow_list_ipv4_prefix` - Your home/office **STATIC** IPv4 address.  Uncomment `allow_list_ipv6_prefix` in `variables.tf` if you plan on using IPv6. I haven't tested it.
* `key_pair_name` - AWS Key Pair so you can SSH into the newly deployed instance to configure / debug it.