resource "digitalocean_droplet" "staging" {
  image = "${var.droplet_image}"
  name = "${var.droplet_name}"
  region = "${var.droplet_region}"
  size = "${var.droplet_size}"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
  }
}
