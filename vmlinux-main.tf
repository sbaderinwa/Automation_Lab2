resource "azurerm_network_interface" "linux_nic" {
  name                = "${var.linux_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.linux_name}-pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  domain_name_label   = var.linux_name
  tags = {
    environment = "Production"
  }
}

resource "azurerm_linux_virtual_machine" "vmlinux" {
  name                = "${var.linux_name}-os-disk"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.Size
  admin_username      = var.Admin_username
  network_interface_ids = [
    azurerm_network_interface.linux_nic.id,
  ]

  admin_ssh_key {
    username   = var.Admin_username
    public_key = file(var.Public_key)
  }

  os_disk {
    caching              = var.OS_disk_attributes["OS_Caching"]
    storage_account_type = var.OS_disk_attributes["OS_Storage_account_type"]
    disk_size_gb         = var.OS_disk_attributes["OS_Disk_size"]
  }

  source_image_reference {
    publisher = var.Linux_Publisher
    offer     = var.Linux_Offer
    sku       = var.Linux_Sku
    version   = var.Linux_Version
  }
}
