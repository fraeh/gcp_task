# load provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

# configure provider
provider "google" {
  credentials = file(var.credentials_file) # store key file in project directory assign file name in terraform.tfvars
  project     = var.project                # e.g. tectask
  region      = var.region                 # e.g. europe-west3
  zone        = var.zone                   # e.g. europe-west3-a
}
