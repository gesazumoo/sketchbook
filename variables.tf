
variable "vm_list" {
  type = map(map(string))
  default = {
    nginx = {
      template = "baseubuntu"
      cores = 2
      memory = "2048"
      disksize = "64G"
      gw = "192.168.123.1"
    },
    # frontend = {
    #   template = "base"
    #   cores = 2
    #   memory = "4096"
    #   disksize = "32G"
    #   gw = "192.168.123.1"
    # },
    # appsmith = {
    #   template = "base"
    #   cores = 4
    #   memory = "4096"
    #   disksize = "64G"
    #   gw = "192.168.123.1"
    # }
  }
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}

variable "pm_host" {
  description = "The hostname or IP of the proxmox server"
  type        = string
  default     = "192.168.191.187"
}

variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default     = "pve"
}

variable "master_disk_type" {
  description = "What interface type are you using? ie. scsi"
  type        = string
  default     = "scsi"
}

variable "master_disk_location" {
  description = "Where do you want to store the disk on your host? ie. zfs-mirror, local, local-lvm, etc."
  type        = string
  default     = "local-lvm"
}

variable "master_ips" {
  description = "List of ip addresses for master nodes"
  type        = list(string)
  default     = [
    "a.a.a.a",
    "b.b.b.b",
    "c.c.c.c",
  ]
}

variable "networkrange" {
  description = "Enter as 8,16,22,24,etc. hint: 10.0.0.0/8"
  default = "10.0.0.0/8"
}