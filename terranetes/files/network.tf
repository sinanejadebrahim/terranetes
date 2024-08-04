resource "hcloud_network" "k8s" {
  name     = "k8s"
  ip_range = "10.0.0.0/16"
  delete_protection = true
}

resource "hcloud_network_subnet" "k8s-subnet" {
  type         = "cloud"
  network_id   = hcloud_network.k8s.id
  network_zone = "eu-central"
  ip_range     = "10.0.1.0/24"
}
