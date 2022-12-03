PVE_IP = 192.168.191.187
USER = root
PUBKEY_PATH = ./root_rsa

.PHONY: install_terraform
intall_terraform:
	brew install hashicorp/tap/terraform

copy_ssh_key:
	ssh-copy-id -i $(PUBKEY_PATH) $(USER)@$(PVE_IP)
# 비밀번호를 입력 안하게 하고싶음. pem파일로 하는거임?

# attach_proxmox_shell라는 파일이 같은 디렉토리에 있어도 무시하고 명령어를 실행함
.PHONY: attach_proxmox_shell
attach_proxmox_shell:
	ssh $(USER)@$(PVE_IP) -i $(PUBKEY_PATH) "whoami"
