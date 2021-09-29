variable "project_id" {
  description = "Enter your GCP Project ID"
  type        = string
}

variable "region" {
  type    = string
  default = "europe-central2"
}

variable "credentials_file" {
description = "Enter the path to your service account key (<name>.json)"
}
