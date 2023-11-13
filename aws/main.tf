module "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
  source                       = "../modules/f5xc/ce/aws"
  owner_tag                    = var.owner
  is_sensitive                 = false
  f5xc_tenant                  = var.f5xc_tenant
  f5xc_api_url                 = var.f5xc_api_url
  f5xc_api_token               = var.f5xc_api_token
  f5xc_namespace               = var.f5xc_namespace
  f5xc_token_name              = format("%s-secure-cloud-ce-%s", var.project_prefix, var.project_suffix)
  f5xc_aws_region              = var.f5xc_aws_region
  f5xc_cluster_name            = format("%s-aws-ce-%s", var.project_prefix, var.project_suffix)
  f5xc_cluster_labels          = { "ves.io/fleet" : format("%s-aws-ce-%s", var.project_prefix, var.project_suffix) }
  f5xc_ce_gateway_type         = "ingress_gateway"
  f5xc_ip_ranges_Asia_TCP      = var.f5xc_ip_ranges_Asia_TCP
  f5xc_ip_ranges_Asia_UDP      = var.f5xc_ip_ranges_Asia_UDP
  f5xc_ce_egress_ip_ranges     = var.f5xc_ce_egress_ip_ranges
  f5xc_ip_ranges_Europe_TCP    = var.f5xc_ip_ranges_Europe_TCP
  f5xc_ip_ranges_Europe_UDP    = var.f5xc_ip_ranges_Europe_UDP
  f5xc_ip_ranges_Americas_TCP  = var.f5xc_ip_ranges_Americas_TCP
  f5xc_ip_ranges_Americas_UDP  = var.f5xc_ip_ranges_Americas_UDP
  f5xc_ce_slo_enable_secure_sg = true
  f5xc_aws_vpc_az_nodes        = {
    node0 = {
      f5xc_aws_vpc_az_name    = format("%s%s", var.f5xc_aws_region, "a"),
      f5xc_aws_vpc_slo_subnet = var.f5xc_aws_vpc_node0_slo_subnet
    }
  }
  aws_vpc_cidr_block                   = var.aws_vpc_cidr_block
  aws_security_group_rules_slo_egress  = []
  aws_security_group_rules_slo_ingress = []
  aws_security_group_rules_sli_egress  = []
  ssh_public_key                       = file(format("%s/%s", va.root_path, var.ssh_public_key_file_absolute))
  providers                            = {
    aws      = aws.default
    volterra = volterra.default
  }
}

output "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
  value = module.f5xc_aws_secure_ce_single_node_single_nic_existing_vpc
}