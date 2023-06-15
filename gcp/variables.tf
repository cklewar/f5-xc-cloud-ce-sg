variable "gcp_region" {
  type = string
}

variable "gcp_zone" {
  type = string
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_application_credentials" {
  type = string
}

variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "subnet_slo_ip_cidr_range" {
  type = string
}

variable "f5xc_cluster_name" {
  type = string
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