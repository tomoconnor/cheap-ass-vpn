# GENERAL
variable "aws_region" {
  type        = string
  description = "The AWS Region"
}

variable "project" {
  type        = string
  description = "The Project name"
}

variable "environment" {
  type        = string
  description = "The environment name"
}

variable "component" {
  type        = string
  description = "The TF component name"
  default     = "cheap-ass-vpn"
}

# SPECIFIC
variable "vpc_id" {
  type = string
  description = "VPC ID into which we deploy the VPN"
}

variable "subnet_id" {
  type = string
  description = "Subnet ID to deploy the VPN Endpoint into"
}

variable "instance_type" {
  type = string
  description = "The EC2 instance type that'll host the VPN"
  default = "t4g.nano" 

variable "vpn_ami_id" {
  type = string
  description = "VPN Endpoint AMI id for the required Architecture(ARM)"
  
}

# Optional
# variable "allow_list_ipv6_prefix" {
#   type        = string
#   description = "The IPv6 Prefix to allow"
# }
variable "allow_list_ipv4_prefix" {
  type        = string
  description = "The IPv4 Prefix to allow"
}

variable "key_pair_name" {
  type = string
  description = "Name of the RSA Keypair to use for SSH to the Endpoint VPN Server for initial configuration"
}