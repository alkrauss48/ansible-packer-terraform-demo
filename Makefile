include .env
export $(shell sed 's/=.*//' .env)

terraform-init:
	cd terraform && terraform init && cd -

terraform-plan:
	cd terraform && \
	terraform plan \
		-var "do_token=${DIGITAL_OCEAN_API_TOKEN}" \
		-var "pub_key=${PUB_KEY}" \
		-var "pvt_key=${PVT_KEY}" \
		-var "ssh_fingerprint=${SSH_FINGERPRINT}" && \
	cd -

packer-build:
	cd packer && \
	packer build -var 'digitalocean_api_token=${DIGITAL_OCEAN_API_TOKEN}' -var-file=variables.json template.json && \
	cd -
