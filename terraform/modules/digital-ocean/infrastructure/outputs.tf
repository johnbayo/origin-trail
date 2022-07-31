output "ipv4" {
  value = digitalocean_droplet.task_vm.*.ipv4_address
}

