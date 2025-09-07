terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.48.0"
    }
  }
}

provider "google" {
  credentials_json: ${{ secrets.GCP_SA_KEY }}
  region      = "us-west1"
}

data "google_project" "acgproject" {
  project_id = var.project_id
}

# Enable the Google API services
resource "google_project_service" "api" {
  for_each                   = toset(var.apis_to_enable)
  project                    = data.google_project.acgproject.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false

}

