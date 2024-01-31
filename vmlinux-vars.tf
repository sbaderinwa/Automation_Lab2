variable "linux_name" {
  default = "n01487128-u-vm1"
}

variable "Size" {
  default = "Standard_B1s"
}

variable "Admin_username" {
  default = "saheed"
}

variable "Public_key" {
  default = "/home/saheed/.ssh/id_rsa.pub"
}

variable "OS_disk_attributes" {
  type = map(string)
  default = {
  OS_Storage_account_type = "Premium_LRS"
  OS_Disk_size = "32"
  OS_Caching = "ReadWrite"
  }
}

variable "Linux_Publisher" {
  default = "Canonical"
}

variable "Linux_Offer" {
  default = "UbuntuServer"
}

variable "Linux_Sku" {
  default = "19.04"
}

variable "Linux_Version" {
  default = "latest"
}
