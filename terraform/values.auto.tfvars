vpc_name       = "origin-trail"
key_path       = "../ansible/files"
key_name       = "sshkey"
vm_size        = "s-2vcpu-2gb"
vm_image       = "ubuntu-20-04-x64"
vm_name        = "node"
region         = ["fra1", "lon1", "sgp1", "ams3", "tor1"]
inventory_path = "../ansible/inventories"
