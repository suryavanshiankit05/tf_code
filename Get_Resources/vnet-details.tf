

# Get All Vnets
data "azurerm_resources" "vnets_e" {
  type = "Microsoft.Network/virtualNetworks"

}

output "list_vnets" {
  value = data.azurerm_resources.vnets_e

}

output "results_vnets" {
  value = {
    count = length(data.azurerm_resources.vnets_e.resources)

  }

}


data "azurerm_virtual_network" "vnets" {
  count               = length(data.azurerm_resources.vnets_e.resources) != 0 ? length(data.azurerm_resources.vnets_e.resources) : 0
  name                = data.azurerm_resources.vnets_e.resources[count.index].name
  resource_group_name = data.azurerm_resources.vnets_e.resources[count.index].resource_group_name
}

output "vnet_details" {
  value = data.azurerm_virtual_network.vnets

}
