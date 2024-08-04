output "master_ips" {
  value = [for server in hcloud_server.master : server.ipv4_address]
}

output "worker_ips" {
  value = [for server in hcloud_server.worker : server.ipv4_address]
}

output "network_id" {
  value = hcloud_network.k8s.id
}



