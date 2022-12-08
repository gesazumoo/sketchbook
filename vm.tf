resource "proxmox_vm_qemu" "proxmox_master" {
  name        = "terraformvm"
  target_node = "pve"
  vmid = 11
  desc = "this is desc"
  clone       = "baseubuntu"

}
