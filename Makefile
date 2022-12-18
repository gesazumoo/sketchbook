PVE_IP = 192.168.191.187
USER = root
# ssh-keygen -f root_rsa
PUBKEY_PATH = ./root_rsa.pub
KEY_PATH = ./root_rsa

VM_USER = root

# .PHONY: install_terraform
# intall_terraform:
# 	brew install hashicorp/tap/terraform

# apply:
# 	terraform apply

# copy_ssh_key:
# 	ssh-copy-id -i $(PUBKEY_PATH) $(USER)@$(PVE_IP)


.PHONY: install_ansible
install_ansible:
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "whoami"
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) bash -c '"apt-get install -y python3.9-distutils && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && pip3 install --ignore-installed ansible"'
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "ansible --version"



.PHONY: ansible_prefix
ansible_prefix:
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "ssh-keygen
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "ssh-copy-id -i ~/.ssh/id_rsa.pub gesazumoo@192.168.123.119"

.PHONY: ansible_exec
ansible_exec:
	scp -r -i $(KEY_PATH) ./ansible/. $(USER)@$(PVE_IP):/opt/ansible
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "ansible-playbook -v /opt/ansible/playbook.yaml -i /opt/ansible/inventory.yaml -e ansible_sudo_pass=12345678"


