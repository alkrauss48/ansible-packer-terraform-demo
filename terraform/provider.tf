variable "do_token" {}
variable "do_image" {
  description = "The Digital Ocean Snapshot ID that was returned from Packer"
}
variable "pub_key" {}
variable "pvt_key" {}
variable "ssh_fingerprint" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
