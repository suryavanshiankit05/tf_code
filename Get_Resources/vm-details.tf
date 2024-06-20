

# Get All VMs
data "azurerm_resources" "vms_e" {
  type = "Microsoft.Compute/virtualMachines"

}

output "list_vms" {
  value = data.azurerm_resources.vms_e

}

output "results_vms" {
  value = {
    count = length(data.azurerm_resources.vms_e.resources)

  }

}


data "azurerm_virtual_machine" "vms" {
  count               = length(data.azurerm_resources.vms_e.resources) != 0 ? length(data.azurerm_resources.vms_e.resources) : 0
  name                = data.azurerm_resources.vms_e.resources[count.index].name
  resource_group_name = data.azurerm_resources.vms_e.resources[count.index].resource_group_name
}

output "vm_details" {
  value = data.azurerm_virtual_machine.vms

}
