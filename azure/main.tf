resource "azurerm_resource_group" "rg" {
  name     = format("%s-rg", var.f5xc_cluster_name)
  location = var.f5xc_azure_region
  provider = azurerm.default
}

module "sg_slo" {
  source                                      = "../modules/azure/security_group"
  custom_tags                                 = var.common_tags
  azure_region                                = var.f5xc_azure_region
  azure_resource_group_name                   = azurerm_resource_group.rg.name
  azure_security_group_name                   = format("%s-slo", var.f5xc_cluster_name)
  azure_linux_security_rules                  = local.azure_security_group_rules_slo_secure_ce
  create_interface_security_group_association = false
  providers                                   = {
    azurerm = azurerm.default
  }
}