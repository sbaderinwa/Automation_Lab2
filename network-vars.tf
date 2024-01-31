variable "rg" {
  default  = "network-rg"
}

variable "location" {
  default  = "Canada Central"
}

variable "vnet" {
  default  = "network-vnet"
}

variable "vnet_addr" {
  default  = ["10.0.0.0/16"]
}

variable "snet" {
  default  = "network-subnet1"
}

variable "snet2" {
  default  = "network-subnet2"
}

variable "snet_addr" {
  default  = ["10.0.0.0/24"]
}

variable "snet2_addr" {
  default  = ["10.0.1.0/24"]
}

variable "nsg1" {
  default  = "network-nsg1"
}

variable "nsg2" {
  default  = "network-nsg2"
}
