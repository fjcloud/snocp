# main.tf

####
# Variables
##

variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type = string
}

variable "ssh_public_key_name" {
  description = "Name of your public key to identify at Hetzner Cloud portal"
  type = string
  default = "ssh_snocp"
}

variable "ssh_public_key" {
  description = "Your public key"
  type = string
}

variable "hcloud_server_type" {
  description = "vServer type name, lookup via `hcloud server-type list`"
  type = string
  default = "cax41"
}

variable "hcloud_server_datacenter" {
  description = "Desired datacenter location name, lookup via `hcloud datacenter list`"
  type = string
  default = "fsn1-dc14"
}

variable "hcloud_server_name" {
  description = "Name of the server"
  type = string
  default = "snocp"
}

####
# Outputs
##

output "snocp_ip" {
  value = hcloud_server.snocp.ipv4_address
}


####
# Infrastructure config
##

resource "hcloud_ssh_key" "key" {
  name = var.ssh_public_key_name
  public_key = var.ssh_public_key
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "snocp" {
  name = var.hcloud_server_name
  labels = { "os" = "coreos" }

  server_type = var.hcloud_server_type
  datacenter = var.hcloud_server_datacenter

#  image = "centos-stream-9"
# ARM
   image = "103907339"
  ssh_keys = [hcloud_ssh_key.key.id]

}
