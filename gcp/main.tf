resource "google_compute_network" "slo_vpc_network" {
  name                    = "${var.f5xc_cluster_name}-slo-vpc-network"
  auto_create_subnetworks = var.auto_create_subnetworks
  provider                = google.default
}

resource "google_compute_subnetwork" "slo_subnet" {
  name          = "${var.f5xc_cluster_name}-slo-subnetwork"
  region        = var.gcp_region
  network       = google_compute_network.slo_vpc_network.id
  ip_cidr_range = var.subnet_slo_ip_cidr_range
  provider      = google.default
}

resource "google_compute_firewall" "slo" {
  for_each           = {for rule in local.f5xc_secure_ce_slo_firewall.rules : rule.name => rule}
  name               = each.value.name
  network            = google_compute_network.slo_vpc_network.name
  priority           = each.value.priority
  direction          = each.value.direction
  target_tags        = each.value.target_tags
  source_ranges      = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges = each.value.direction == "EGRESS" ? each.value.ranges : null

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  dynamic "deny" {
    for_each = each.value.deny
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }
  log_config {
    metadata = each.value.log_config.metadata
  }
  provider = google.default
}