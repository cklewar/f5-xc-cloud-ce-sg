variable "common_tags" {
  type = map(string)
}

variable "f5xc_cluster_name" {
  type = string
}

variable "aws_vpc_cidr_block" {
  type = string
}

variable "aws_vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "aws_vp_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "aws_security_group_rules_slo_egress_secure_ce" {
  type = list(object({
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}

variable "aws_security_group_rules_slo_egress_secure_ce_extended" {
  type = list(object({
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}

variable "aws_security_group_rules_slo_ingress_secure_ce" {
  type = list(object({
    from_port   = string
    to_port     = string
    ip_protocol = string
    cidr_blocks = list(string)
  }))
}

variable "f5xc_ip_ranges_Americas_TCP" {
  type = list(string)
}

variable "f5xc_ip_ranges_Americas_UDP" {
  type = list(string)
}

variable "f5xc_ip_ranges_Europe_TCP" {
  type = list(string)
}

variable "f5xc_ip_ranges_Europe_UDP" {
  type = list(string)
}

variable "f5xc_ip_ranges_Asia_TCP" {
  type = list(string)
}

variable "f5xc_ip_ranges_Asia_UDP" {
  type = list(string)
}

variable "f5xc_ce_egress_ip_ranges" {
  type        = list(string)
  description = "Egress IP ranges for F5 XC CE"
}