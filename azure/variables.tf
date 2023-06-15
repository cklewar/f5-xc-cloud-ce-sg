variable "common_tags" {
  type = map(string)
}

variable "f5xc_azure_region" {
  type = string
}

variable "f5xc_cluster_name" {
  type = string
}

variable "azurerm_resource_group_name" {
  type = string
}

variable "azurerm_security_group_slo_id" {
  type = list(object({
    name                         = string
    access                       = string
    priority                     = number
    protocol                     = string
    direction                    = string
    source_port_range            = string
    source_address_prefix        = optional(string)
    source_address_prefixes      = optional(list(string))
    destination_port_range       = string
    destination_address_prefix   = optional(string)
    destination_address_prefixes = optional(list(string))
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