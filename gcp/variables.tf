variable "slo_network" {
  type = string
}

variable "f5xc_ce_slo_firewall" {
  type = object({
    rules = list(object({
      name        = string
      priority    = string
      description = string
      direction   = string
      target_tags = optional(list(string))
      ranges      = list(string)
      allow       = list(object({
        protocol = string
        ports    = optional(list(string))
      }))
      deny = list(object({
        protocol = string
        ports    = optional(list(string))
      }))
      log_config = optional(object({
        metadata = string
      }))
    }))
  })
}

variable "gcp_region" {
  type    = string
  default = "us-east1"
  # default = "us-east4"
}

variable "gcp_zone" {
  type    = string
  default = "us-east1-b"
  # default = "us-east4-b
}

variable "gcp_project_id" {
  type = string
}

variable "gcp_application_credentials" {
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