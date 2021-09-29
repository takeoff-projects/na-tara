terraform {

 required_version = ">= 0.14"

 required_providers {
     # Cloud Run support was added on 3.3.0
     google = ">= 3.3"
   }
}

provider "google" {
  credentials = file(var.credentials_file)
  project = var.project_id
  region  = var.region
}

# Enables the Cloud Run API
resource "google_project_service" "run_api" {

  service = "run.googleapis.com"

  disable_on_destroy = true
}

# Enable the Firestore
resource "google_project_service" "firestore" {

  service = "firestore.googleapis.com"

  disable_on_destroy = false
}

#Create Firestore collection
resource "google_firestore_document" "pet1" {
  collection  = "Pet"
  document_id = "Pet-1"
  fields      = "{\"petname\":{\"stringValue\":\"Dolly\"}, \"owner\":{\"stringValue\":\"Julie\"}, \"likes\":{\"integerValue\":\"10\"}, \"image\":{\"stringValue\":\"https://image.shutterstock.com/image-photo/funny-dog-licking-lips-tongue-600w-1761385949.jpg\"}}"
}

resource "google_firestore_document" "pet2" {
  collection  = "Pet"
  document_id = "Pet-2"
  fields      = "{\"petname\":{\"stringValue\":\"Bombel\"}, \"owner\":{\"stringValue\":\"Jon\"}, \"likes\":{\"integerValue\":\"15\"}, \"image\":{\"stringValue\":\"https://image.shutterstock.com/image-photo/golden-retriever-playing-water-linking-600w-2023596761.jpg\"}}"
}

# Create the Cloud Run service
resource "google_cloud_run_service" "run_service" {
  name = "go-pets-app"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/go-pets:latest"

        env {
            name = "GOOGLE_CLOUD_PROJECT"
            value = var.project_id
            }
        env {
             name = "GOOGLE_APPLICATION_CREDENTIALS"
             value = var.credentials_file
             }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.run_service.name
  location = google_cloud_run_service.run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Display the service URL
output "service_url" {
  value = google_cloud_run_service.run_service.status[0].url
}
