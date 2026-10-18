locals {
  my_tag = {
    environment = "Prod"
    owner = "chandan"
    managed_by = "ranjeet"
    cost_center = "IT Department"
  }
}

resource "azurerm_resource_group" "ravi-rg" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
  tags     = local.my_tag

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_virtual_network" "ravi-vnet" {
  for_each            = var.virtual
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  tags                = local.my_tag

  lifecycle {
    prevent_destroy = true
  }

 #Dynamic bkock integration 
    dynamic "subnet" {
    for_each = each.value.subnet != null ? each.value.subnet : []
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefixes 
    }
}
}