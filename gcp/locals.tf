locals {
  cluster_labels  = var.f5xc_fleet_label != "" ? { "ves.io/fleet" = var.f5xc_fleet_label } : {}
  f5xc_image_name = format("%s-%s", var.machine_image_name, var.project_suffix)
}