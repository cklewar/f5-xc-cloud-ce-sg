module "gcp_secure_cloud_ce_single_provided_prefixes_node_single_nic_new_vpc" {
  source                       = "../modules/f5xc/ce/gcp"
  owner                        = var.owner
  gcp_region                   = var.gcp_region
  ssh_username                 = "centos"
  ssh_public_key               = file(format("%s/%s", var.root_path, var.ssh_public_key_file_absolute))
  instance_image               = var.machine_image_base["ingress_gateway"]
  f5xc_tenant                  = var.f5xc_tenant
  f5xc_api_url                 = var.f5xc_api_url
  f5xc_namespace               = var.f5xc_namespace
  f5xc_api_token               = var.f5xc_api_token
  f5xc_token_name              = format("%s-%s-%s", var.project_prefix, var.project_name, var.project_suffix)
  f5xc_cluster_name            = format("%s-%s-%s", var.project_prefix, var.project_name, var.project_suffix)
  f5xc_ce_slo_subnet           = var.f5xc_ce_slo_subnet
  f5xc_ce_gateway_type         = "ingress_gateway"
  f5xc_ip_ranges_Asia_TCP      = var.f5xc_ip_ranges_Asia_TCP
  f5xc_ip_ranges_Asia_UDP      = var.f5xc_ip_ranges_Asia_UDP
  f5xc_ce_egress_ip_ranges     = var.f5xc_ce_egress_ip_ranges
  f5xc_ip_ranges_Europe_TCP    = var.f5xc_ip_ranges_Europe_TCP
  f5xc_ip_ranges_Europe_UDP    = var.f5xc_ip_ranges_Europe_UDP
  f5xc_ip_ranges_Americas_TCP  = var.f5xc_ip_ranges_Americas_TCP
  f5xc_ip_ranges_Americas_UDP  = var.f5xc_ip_ranges_Americas_UDP
  f5xc_ce_slo_enable_secure_sg = true
  f5xc_ce_nodes                = {
    node0 = {
      az = format("%s-b", var.gcp_region)
    }
  }
  providers = {
    google   = google.default
    volterra = volterra.default
  }
}

output "gcp_secure_cloud_ce_single_provided_prefixes_node_single_nic_new_vpc" {
  value = module.gcp_secure_cloud_ce_single_provided_prefixes_node_single_nic_new_vpc.ce
}