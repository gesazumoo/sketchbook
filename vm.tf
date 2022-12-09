resource "proxmox_vm_qemu" "cloudinit_test2" {
  name        = "tftest2"
  desc        = "tf description"
  target_node = "pve"
  os_type     = "ubuntu"
  clone       = "baseubuntu"

  disk {
    type    = "scsi"
    size    = "40G"
    storage = "local-lvm"
  }

  full_clone = false

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # define_connection_info = true
  # os_network_config      = <<EOF
  # EOF
  cores                  = 3
  sockets                = 1
  memory                 = 2560

# 그냥 올리고 ip는 수동으로...
# 템플릿에서 gesazumoo 계정 추가된걸로 변경하고
# docker, docker compose 설치.
# ansible로 ect/opt아래에 docker-compose.yml 파일 만들기
}
