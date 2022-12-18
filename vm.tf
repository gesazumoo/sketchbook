resource "proxmox_vm_qemu" "cloudinit_test2" {
  for_each = var.vm_list

  name        =  each.key
  target_node = "pve"
  os_type     = "ubuntu"
  clone       = each.value.template

  disk {
    type    = "scsi"
    size    = each.value.harddisk
    storage = "local-lvm"
  }

  full_clone = false

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  cores                  = each.value.cores
  sockets                = 1
  memory                 = each.value.memory

# 그냥 올리고 ip는 수동으로...
# 템플릿에서 gesazumoo 계정 추가된걸로 변경하고
# docker, docker compose 설치.
# ansible로 ect/opt아래에 docker-compose.yml 파일 만들기
}
