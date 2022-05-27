







module "module_create_resource_group" {
  source                           = "../../modules/module_resource-group-creation/resource_group"
  resource_group_name              = var.resource_group
  resource_group_location          = var.location
  tags                             = var.tags
}

module "virtual_network" {
  source                       = "../../modules/module_virtual-network-creation/network-module"
  rg_name                      = var.resource_group
  rg_location                  = var.location
  vnet_name                    = var.virtual_network
  address_space                = var.address_space
  dns_servers                  = var.dns_servers
  enable_ddos_protection_plan1 = var.enable_ddos_protection_plan1
  network_ddos_protection_plan = var.network_ddos_protection_plan
  subnet_name                  = var.subnet_name
  address_prefixes             = var.address_prefixes
  service_endpoints            = var.service_endpoints
  tags                         = var.tags
  depends_on = [
    module.module_create_resource_group
  ]
}




/*
module "vnet_monitoring" {

  source = "../../modules/module_virtual-network-creation/diag_setting"

  resource_id = module.virtual_network.vnet_id

  storage_account_id = module.virtual_network.storage_account_id

  resource_group_name = module.virtual_network.resource_group

  resource_group_id = module.virtual_network.resource_group_id

  resource_group_location = module.virtual_network.resource_group_location


}

module "module_resource-role-assignment" {

  source = "../../modules/module_virtual-network-creation/rbac"

  count = length(data.azurerm_resources.example.resources)

  resource_group_name = module.virtual_network.resource_group

  scope = data.azurerm_resources.example.resources[count.index].id

  role_definition_name = var.role_definition_name

}

*/