resource "google_storage_bucket" "mybucket" {
  name     = "terrafoem-statefile-bckup001"
  location = "us-central1"
  uniform_bucket_level_access = true
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }
}

