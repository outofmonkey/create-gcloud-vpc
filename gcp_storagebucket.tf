resource "google_storage_bucket" "mybucket" {
  name     = "terrafoem-statefile-bckup001"
  location = "us-central1"
  uniform_bucket_level_access = true
  project = data.google_project.project.project_id
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
}
