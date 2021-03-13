# creates lowercase network id for resource names of each customer
locals {
  network_id = lower(var.instance_customer)
}

# Creates vpc networks
resource "google_compute_network" "blue" {
  name = format("%s-blue-network", local.network_id)
  auto_create_subnetworks = "true"
}

resource "google_compute_network" "green" {
  name                    = format("%s-green-network", local.network_id)
  auto_create_subnetworks = "false"
}

# Creates vpc peerings and assigns to related network
resource "google_compute_network_peering" "blue" {
  name         = format("%s-blue-peering", local.network_id)
  network      = google_compute_network.blue.id
  peer_network = google_compute_network.green.id
}
resource "google_compute_network_peering" "green" {
  name         = format("%s-green-peering", local.network_id)
  network      = google_compute_network.green.id
  peer_network = google_compute_network.blue.id
}