
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      skip_shutdown_and_force_delete = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }
}

locals {
  tags = {
    Name = "Matt Braunwart"
    Purpose = "RHCSA Study Lab"
  }
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = local.tags
}

# Create a network interface
resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_ip_configuration.name
    private_ip_address_allocation = var.nic_ip_configuration.private_ip_address_allocation
    subnet_id                     = azurerm_subnet.subnet.id
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
  tags = local.tags
}

# Create the RHEL virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = lookup(var.vm_os_disk, "caching", "ReadWrite")
    storage_account_type = lookup(var.vm_os_disk, "storage_account_type", "Standard_LRS")
    disk_size_gb         = lookup(var.vm_os_disk, "disk_size_gb", 100)
  }

  source_image_reference {
    publisher = lookup(var.vm_image, "publisher", "RedHat")
    offer     = lookup(var.vm_image, "offer", "RHEL")
    sku       = lookup(var.vm_image, "sku", "8-lvm-gen2") # Adjust the default SKU as needed
    version   = lookup(var.vm_image, "version", "latest")
  }

  dynamic "plan" {
    for_each = var.vm_plan != {} && var.vm_plan.name != null ? [var.vm_plan] : []
    content {
      name      = var.vm_plan.name
      product   = var.vm_plan.product
      publisher = var.vm_plan.publisher
    }
  }
  tags = local.tags
}
