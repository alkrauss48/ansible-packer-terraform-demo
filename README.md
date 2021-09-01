Ansible, Packer, and Terraform Demo
===

## [YouTube Video over this demo](https://www.youtube.com/watch?v=pkEezNSFWtA)

This project combines Ansible, Packer, and Terraform to show how you can
automagically script and deploy a server with no manual configuration. In case
you're unfamiliar with these 3 tools:

* [Ansible](https://www.ansible.com/) - Automates server configuration
* [Packer](https://www.packer.io/) - Builds images of a configured server, but
doesn't actually deploy it
* [Terraform](https://www.terraform.io/) - Handles deploying an actual server

## Overview

This project creates a Digital Ocean droplet that runs a local version of the website
[https://growlerfriday.com](https://growlerfriday.com) - which is pulled down
from [its GitHub repo](https://github.com/alkrauss48/growler-friday) and run using nginx.

If you edit your /etc/hosts file to point growlerfriday.com to the IP address of
the created droplet, it will work.

## Usage

Prior to running, make sure you have both packer and terraform installed.

```bash
git clone https://github.com/alkrauss48/ansible-packer-terraform-demo.git
cd ansible-packer-terraform-demo

# Set the variables in the .env file. At a minimum, this includes:
# * DIGITAL_OCEAN_API_TOKEN
# * SSH_FINGERPRINT

make packer-build
# This will take about 5 minutes. Copy the Snapshot ID you get at the end

make terraform-init
# Only have to do this once

make terraform-plan
<enter Snapshot ID from packer-build command>

# If all looks good, then:

make terraform-apply
<enter Snapshot ID from packer-build command>
# This will take about a minute

# Done!
```

MIT Licensed. [Aaron Krauss](https://thesocietea.org).
