include .env
export $(shell sed 's/=.*//' .env)

terraform-init:
	cd terraform && terraform init && cd -

terraform-plan:
	cd terraform && \
	terraform plan \
		-var "do_token=${DIGITAL_OCEAN_API_TOKEN}" \
		-var "droplet_name=${DROPLET_NAME}" \
		-var "droplet_region=${DROPLET_REGION}" \
		-var "droplet_size=${DROPLET_SIZE}" \
		-var "pub_key=${PUB_KEY}" \
		-var "pvt_key=${PVT_KEY}" \
		-var "ssh_fingerprint=${SSH_FINGERPRINT}" && \
	cd -

packer-build:
	cd packer && \
	packer build template.json && \
	cd -
