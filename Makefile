CONF_FILES=$(shell find conf -type f)
CONTENT_FILES=$(shell find content -type f)
IP_ADDR=$(shell node get_ip.js)

.PHONY: myserver
myserver: $(CONF_FILES) $(CONTENT_FILES)
	docker build . -t myserver

.PHONY: run
run:
	docker run -p 8080:80 -t myserver

# Not so sure of that. Should I destroy first?
terraform.tfstate: variables.tf main.tf
	terraform apply

inventory.cfg: terraform.tfstate
	echo "[web]" > $@
	echo $(IP_ADDR) >> $@

.PHONY: deploy_nginx
deploy_nginx: inventory.cfg nginx.yml
	ansible-playbook -i inventory.cfg nginx.yml --private-key ~/.ssh/id_rsa -u root

.PHONY: ssh
ssh:
	ssh root@$(IP_ADDR)