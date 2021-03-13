variable "project" {
  type        = string
  description = "GCP project name"
}

variable "credentials_file" {
  type        = string
  description = "Path to the service account key file"
}

variable "region" {
  type        = string
  default     = "europe-west3"
  description = "GCP region, e.g. europe-west2"
}

variable "zone" {
  type        = string
  default     = "europe-west3-c"
  description = "GCP zone, e.g. europe-west2-a"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Set an environment to choose a predefined machine type for gcp instance."
}

variable "machine_types" {
  type = map(any)
  default = {
    dev  = "f1-micro"
    prod = "e2-medium"
  }
  description = "Some predefined machine types for gcp instances."
}

variable "os_image" {
  type        = string
  default     = "debian-cloud/debian-9"
  description = "Linux image"
}

variable "instance_name" {
  type        = string
  default     = "webservice"
  description = "Name of gcp instance"
}

variable "instance_customer" {
  type        = string
  default     = "sandbox"
  description = "Name of costumer"
}