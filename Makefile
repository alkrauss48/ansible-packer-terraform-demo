include .env
export $(shell sed 's/=.*//' .env)

terraform-plan:
	cd terraform && \
	terraform plan \
		-var "do_token=${DIGITAL_OCEAN_API_TOKEN}" \
		-var "pub_key=${HOME}/.ssh/id_rsa.pub" \
		-var "pvt_key=${HOME}/.ssh/id_rsa" \
		-var "ssh_fingerprint=${SSH_FINGERPRINT}" && \
	cd -

packer-build:
	cd packer && \
	packer build -var 'digitalocean_api_token=${DIGITAL_OCEAN_API_TOKEN}' -var-file=variables.json template.json && \
	cd -
