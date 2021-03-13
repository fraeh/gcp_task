# creates lowercase instance id for each customer instance
locals {
  customer_instance_id = format("%s-%s", lower(var.instance_customer), lower(var.instance_name))
}

resource "google_compute_instance" "tf-instance" {
  # basic instance configuration
  # instance name will be generated from customer and instance name
  # default values are provided in variables.tf
  name         = local.customer_instance_id
  machine_type = var.machine_types[var.environment]
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.os_image
    }
  }

  # bind instance to a network defined in network.tf 
  # Uncomment access_config section to assign an external ip address
  network_interface {
    network = google_compute_network.blue.name
    # access_config {
    # }
  }
}