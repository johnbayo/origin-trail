module "VM" {
  source         = "./modules/digital-ocean/infrastructure"
  region         = var.region
  vpc_name       = var.vpc_name
  key_path       = var.key_path
  key_name       = var.key_name
  vm_instances   = var.vm_instances
  vm_size        = var.vm_size
  vm_image       = var.vm_image
  vm_name        = var.vm_name
  inventory_path = var.inventory_path
}

locals {
    external_ip = flatten([for i in module.VM : i])
}

resource "local_file" "inventory" {
  content  = templatefile("inventory.tmpl", { ips = local.external_ip } )
  filename = "${var.inventory_path}/inventory.yml"
  file_permission = "0644"
}