

# Get All VMs
data "azurerm_resources" "vms" {
  type = "Microsoft.Compute/virtualMachines"

}

output "list_vms" {
  value = data.azurerm_resources.vms

}

output "results_vms" {
  value = {
    total_machines = length(data.azurerm_resources.vms.resources)
    tag_environemt = [for i in data.azurerm_resources.vms.resources : i.tags if length(i.tags) != 0]
    names          = [for i in data.azurerm_resources.vms.resources : i.name]

  }

}


# Get All VNets
data "azurerm_resources" "vnets" {
  type = "Microsoft.Network/virtualNetworks"

}

output "list_vnets" {
  value = data.azurerm_resources.vnets

}

output "results_vnets" {
  value = {
    total_vnets = length(data.azurerm_resources.vnets.resources)
    names       = [for i in data.azurerm_resources.vnets.resources : i.name]

  }

}