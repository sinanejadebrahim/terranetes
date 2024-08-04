resource "hcloud_server" "master" {
  count                    = var.master_count
  name                     = "master-${count.index + 1}"
  server_type              = var.server_type
  image                    = var.image
  ssh_keys                 = var.ssh_keys
  location                 = var.location
  shutdown_before_deletion = true
  delete_protection        = true
  rebuild_protection       = true

  labels = {
    role = "master"
  }

  network {
    network_id = hcloud_network.k8s.id
  }

  depends_on = [
    hcloud_network_subnet.k8s-subnet
  ]

  lifecycle {
    ignore_changes = [ssh_keys, network]
  }

}

resource "hcloud_server" "worker" {
  count                    = var.worker_count
  name                     = "worker-${count.index + 1}"
  server_type              = var.server_type
  image                    = var.image
  ssh_keys                 = var.ssh_keys
  location                 = var.location
  shutdown_before_deletion = true
  labels = {
    role = "worker"
  }

  network {
    network_id = hcloud_network.k8s.id
  }
  depends_on = [
    hcloud_network_subnet.k8s-subnet
  ]

  lifecycle {
    ignore_changes = [ssh_keys, network]
  }

}
