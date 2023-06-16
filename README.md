# CLOUD CE SG

Terraform to create F5XC Cloud CE with SLO secure SG applied. 
 
- Clone this repo with `git clone --recurse-submodules https://github.com/cklewar/f5-xc-cloud-ce-sg`
- Enter repository directory with `cd f5-xc-cloud-ce-sg`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Generate F5XC API token for later usage as TF input data
- Enter cloud provider specific directory e.g. aws `cd aws`
  * Change backend settings in `versions.tf` file to fit your environment needs
  * Change `terraform.tfvars` input variables as needed
  * Provide values for input variables
    * f5xc_api_p12_file
    * f5xc_api_url
    * f5xc_api_token
    * f5xc_tenant
  * Initialize with `terraform init`
  * Apply with `terraform apply -auto-approve` or destroy with `terraform destroy -auto-approve`
  * Repeat steps for gcp and azure

##  Public prefixes lists
To generate up to date ip prefix list form official F5 XC documentation `f5_xc_pub_prefix_gen` tool is available at https://github.com/cklewar/f5-xc-pub-prefix-gen.
To generate additional SG egress ip prefix list `fw_log_ip_extractor` script is available at https://github.com/cklewar/gcp_fw_log_ip_extractor.

Example run for `f5-xc-pub-prefix-gen`:

https://github.com/cklewar/f5-xc-cloud-ce-sg/assets/29709930/92b5e10a-9cad-4d60-8f94-6184a3d813a7

## Usage

## F5XC AWS Cloud CE SG module usage example
  
````hcl
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
      f5xc_aws_vpc_slo_subnet    = "172.16.44.0/27",
      f5xc_aws_vpc_az_name       = format("%s%s", var.f5xc_aws_region, "a"),
      f5xc_aws_vpc_nat_gw_subnet = "172.16.44.32/27",
    }
  }
  aws_vpc_cidr_block                   = "127.16.40.0/21"
  aws_security_group_rules_slo_egress  = []
  aws_security_group_rules_slo_ingress = []
  aws_security_group_rules_sli_egress  = []
  ssh_public_key                       = file(var.ssh_public_key_file)
  providers                            = {
    aws      = aws.default
    volterra = volterra.default
  }
}

output "f5xc_aws_secure_ce_single_node_single_nic_existing_vpc" {
  value = module.f5xc_aws_secure_ce_single_node_single_nic_existing_vpc
}
````

## F5XC GCP Cloud CE SG module usage example

```hcl
module "gcp_secure_cloud_ce_single_provided_prefixes_node_single_nic_new_vpc" {
  source                       = "../modules/f5xc/ce/gcp"
  owner                        = var.owner
  gcp_region                   = var.gcp_region
  ssh_username                 = "centos"
  ssh_public_key               = file(var.ssh_public_key_file)
  instance_image               = var.machine_image_base["ingress_gateway"]
  f5xc_tenant                  = var.f5xc_tenant
  f5xc_api_url                 = var.f5xc_api_url
  f5xc_namespace               = var.f5xc_namespace
  f5xc_api_token               = var.f5xc_api_token
  f5xc_token_name              = format("%s-%s-%s", var.project_prefix, var.project_name, var.project_suffix)
  f5xc_cluster_name            = format("%s-%s-%s", var.project_prefix, var.project_name, var.project_suffix)
  f5xc_ce_slo_subnet           = "10.15.250.0/24"
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
```