variable "digital_ocean_api_token" {}
variable "droplet_image" {
  description = "The Digital Ocean Snapshot ID that was returned from Packer"
}
variable "droplet_name" {}
variable "droplet_region" {}
variable "droplet_size" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.digital_ocean_api_token}"
}
