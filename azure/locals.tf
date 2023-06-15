locals {
  f5xc_ip_ranges_americas = setunion(var.f5xc_ip_ranges_Americas_TCP, var.f5xc_ip_ranges_Americas_UDP)
  f5xc_ip_ranges_europe   = setunion(var.f5xc_ip_ranges_Europe_TCP, var.f5xc_ip_ranges_Europe_UDP)
  f5xc_ip_ranges_asia     = setunion(var.f5xc_ip_ranges_Asia_TCP, var.f5xc_ip_ranges_Asia_UDP)
  f5xc_ip_ranges_all      = setunion(var.f5xc_ip_ranges_Americas_TCP, var.f5xc_ip_ranges_Americas_UDP, var.f5xc_ip_ranges_Europe_TCP, var.f5xc_ip_ranges_Europe_UDP, var.f5xc_ip_ranges_Asia_TCP, var.f5xc_ip_ranges_Asia_UDP)

  azure_security_group_rules_slo_secure_ce = [
    {
      name                       = format("%s-secure-ce-slo-egress-icmp", var.f5xc_cluster_name)
      priority                   = 150
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = format("%s-secure-ce-slo-egress-ntp", var.f5xc_cluster_name)
      priority                   = 151
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "123"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                         = format("%s-secure-ces-slo-egress-nat-t", var.f5xc_cluster_name)
      priority                     = 152
      direction                    = "Outbound"
      access                       = "Allow"
      protocol                     = "Udp"
      source_port_range            = "*"
      destination_port_range       = "4500"
      source_address_prefix        = "*"
      destination_address_prefixes = local.f5xc_ip_ranges_all
    },
    {
      name                         = format("%s-secure-ce-slo-egress-https", var.f5xc_cluster_name)
      priority                     = 153
      direction                    = "Outbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_port_range            = "*"
      destination_port_range       = "443"
      source_address_prefix        = "*"
      destination_address_prefixes = var.f5xc_ce_egress_ip_ranges
    },
    {
      name                       = format("%s-secure-ce-slo-ingress-nat-t", var.f5xc_cluster_name)
      priority                   = 154
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "4500"
      source_address_prefixes    = local.f5xc_ip_ranges_all
      destination_address_prefix = "*"
    },
    {
      name                       = format("%s-secure-ce-slo-ingress-ssh", var.f5xc_cluster_name)
      priority                   = 155
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}