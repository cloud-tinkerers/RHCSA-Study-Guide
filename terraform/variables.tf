# Resource Group Variables (No Defaults)
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "mrb-rhcsa-exam-study"
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "Resource group name must not be empty."
  }
}

variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "East US"
  validation {
    condition     = length(var.location) > 0
    error_message = "Location must not be empty."
  }
}

# Resource Name Variables
variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "mrb-VNet"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "mrb-Subnet"
}

variable "public_ip_name" {
  description = "Name of the public IP"
  type        = string
  default     = "mrb-PublicIP"
}

variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
  default     = "mrb-NIC"
}

variable "virtual_machine_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "mrb-rhcsa-exam"
}

variable "my_public_ip" {
  description = "Your public IP address for SSH access"
  type        = string
  default     = "86.48.9.251"
}

# Name for the Network Security Group
variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
  default     = "mrb-NSG"
}

# Network Configuration Variables
variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nic_ip_configuration" {
  description = "IP configuration for the network interface"
  type = object({
    name                          = optional(string, "myNICConfiguration")
    private_ip_address_allocation = optional(string, "Dynamic")
  })
  default = {}
}

# VM Configuration Variables
variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "mrb-admin"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "./rhcsa-exam.pub"
}

variable "vm_os_disk" {
  description = "Configuration for the OS disk of the VM"
  type = object({
    caching              = optional(string, "ReadWrite")
    storage_account_type = optional(string, "Standard_LRS")
    disk_size_gb         = optional(number, 100)
  })
  default = {}
}

variable "vm_image" {
  description = "Source image reference for the VM"
  type = object({
    publisher = optional(string, "RedHat")
    offer     = optional(string, "RHEL")
    sku       = optional(string, "8-lvm-gen2")
    version   = optional(string, "latest")
  })
  default = {}
}

variable "vm_plan" {
  description = "Plan information for the VM"
  type = object({
    name      = optional(string)
    product   = optional(string)
    publisher = optional(string)
  })
  default = {}
}


