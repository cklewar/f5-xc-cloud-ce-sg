resource "aws_vpc" "vpc" {
  tags                 = var.common_tags
  cidr_block           = var.aws_vpc_cidr_block
  enable_dns_support   = var.aws_vpc_enable_dns_support
  enable_dns_hostnames = var.aws_vp_enable_dns_hostnames
  provider             = aws.default
}

module "aws_security_group_slo_secure_ce" {
  source                       = "../modules/aws/security_group"
  aws_vpc_id                   = aws_vpc.vpc.id
  custom_tags                  = var.common_tags
  description                  = "F5 XC SECURE CLOUD CE SLO SG"
  aws_security_group_name      = format("%s-sg-slo-secure-ce", var.f5xc_cluster_name)
  security_group_rules_egress  = local.aws_security_group_rules_slo_egress_secure_ce
  security_group_rules_ingress = local.aws_security_group_rules_slo_ingress_secure_ce
  providers                    = {
    aws = aws.default
  }
}

module "aws_security_group_slo_secure_ce_extended" {
  source                       = "../modules/aws/security_group"
  aws_vpc_id                   = aws_vpc.vpc.id
  custom_tags                  = var.common_tags
  description                  = "F5 XC SECURE CLOUD CE SLO SG EXTENDED"
  aws_security_group_name      = format("%s-sg-slo-secure-ce-extended", var.f5xc_cluster_name)
  security_group_rules_egress  = local.aws_security_group_rules_slo_egress_secure_ce_extended
  security_group_rules_ingress = []
  providers                    = {
    aws = aws.default
  }
}