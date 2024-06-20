

data "azurerm_resources" "resource_groups" {
 # type = "Microsoft.Network/virtualNetworks"
##   type = "Microsoft.Network/virtualNetworks/subnets"
#   name = ""
type = "Microsoft.Compute/virtualMachines"

}



# output "test" {
#   value = data.azurerm_resources.resource_groups

# }

output "results" {
  value = {
    total_machines = length(data.azurerm_resources.resource_groups.resources)
    tag_environemt = [ for i in data.azurerm_resources.resource_groups.resources : i.tags if length(i.tags )!= 0 && i.tags.sbia-rating]
    
  }

}