resource "proxmox_vm_qemu" "cloudinit_test" {
  name        = "tftest1"
  desc        = "tf description"
  target_node = "pve"
  os_type     = "cloud-init"
  clone       = "baseubuntu"

  disk {
    type    = "scsi"
    size    = "40G"
    storage = "local-lvm"
  }

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  cores   = 3
  sockets = 1
  memory  = 2560

  ipconfig0 = "ip=192.168.123.55/16,gw=10.0.2.2"
}
