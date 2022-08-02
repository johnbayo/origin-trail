terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

###############################
#   VPC
###############################
resource "digitalocean_vpc" "task_vpc" {
  count  = length(var.region)
  name   = "${var.vpc_name}-${format("%02d", count.index + 1)}"
  region = element(var.region, count.index % length(var.region))
}

################################
# SSH KEY GENERATION
################################
resource "tls_private_key" "task_key" {
  algorithm = "RSA"
}

resource "local_file" "task_private_key" {
  filename          = "${var.key_path}/${var.key_name}.pem"
  sensitive_content = tls_private_key.task_key.private_key_pem
  file_permission   = "0400"
}

resource "digitalocean_ssh_key" "task_key_pair" {
  name       = var.key_name
  public_key = tls_private_key.task_key.public_key_openssh
}

##################################
# VM INSTANCE
##################################
resource "digitalocean_droplet" "task_vm" {
  count    = length(var.region)
  name     = "${var.vm_name}${format("%02d", count.index + 1)}"
  size     = var.vm_size
  image    = var.vm_image
  region   = element(var.region, count.index % length(var.region))
  ssh_keys = [digitalocean_ssh_key.task_key_pair.id]
  vpc_uuid = element(digitalocean_vpc.task_vpc.*.id, count.index % length(var.region))
}