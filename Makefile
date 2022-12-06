PVE_IP = 192.168.191.187
USER = root
# ssh-keygen -f root_rsa
PUBKEY_PATH = ./root_rsa.pub
KEY_PATH = ./root_rsa

.PHONY: install_terraform
intall_terraform:
	brew install hashicorp/tap/terraform

copy_ssh_key:
	ssh-copy-id -i $(PUBKEY_PATH) $(USER)@$(PVE_IP)
# todo 비밀번호를 입력 안하게 하고싶음. pem파일로 하는거임?

.PHONY: install_ansible
install_ansible:
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "whoami"
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) bash -c '"apt-get install -y python3.9-distutils && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && pip3 install --ignore-installed ansible"'
	ssh $(USER)@$(PVE_IP) -i $(KEY_PATH) "ansible --version"


apply:
	terraform apply