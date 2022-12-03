resource "proxmox_vm_qemu" "proxmox_master" {
  for_each = var.vm_list

  name        = each.key
  target_node = var.pm_node_name
  clone       = each.value.template
  full_clone = false
  clon
  agent       = 1
  memory      = each.value.memory
  cores       = each.value.cores
  disk {
    slot     = 0
    size     = each.value.disksize
    type     = var.master_disk_type
    storage  = var.master_disk_location
    iothread = 1
  }
  ipconfig0 = "ip=${var.master_ips[0]}/${var.networkrange},gw=${each.value.gw}"
  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network
    ]
  }
}
