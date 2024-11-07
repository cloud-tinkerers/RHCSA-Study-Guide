# Resource Group Output
output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.rg.id
}

# Virtual Network Outputs
output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.vnet.address_space
}

# Subnet Outputs
output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = azurerm_subnet.subnet.address_prefixes
}

# Public IP Outputs
output "public_ip_id" {
  description = "The ID of the public IP"
  value       = azurerm_public_ip.public_ip.id
}

output "public_ip_address" {
  description = "The public IP address assigned to the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

# Network Interface Outputs
output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

output "network_interface_private_ip" {
  description = "The private IP address of the network interface"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}

# Virtual Machine Outputs
output "virtual_machine_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "virtual_machine_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "virtual_machine_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "virtual_machine_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}

output "virtual_machine_ssh_command" {
  description = "Command to SSH into the virtual machine"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.public_ip.ip_address}"
}

# Network Security Group Outputs
output "network_security_group_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "network_security_group_name" {
  description = "The name of the network security group"
  value       = azurerm_network_security_group.nsg.name
}