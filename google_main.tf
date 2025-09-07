terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.48.0"
    }
  }
}

provider "google" {
  region      = "us-central1"
}

# Enable the Google API services
resource "google_project_service" "api" {
  for_each                   = toset(var.apis_to_enable)
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false

}




