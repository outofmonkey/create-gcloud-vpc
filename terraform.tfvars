project_id = ${{ vars.myproject_id}}
apis_to_enable = [
  "cloudresourcemanager.googleapis.com",  # ENABLED TO RUN TERRAFORM 
  "compute.googleapis.com",
  # "networkmanagement.googleapis.com ",
  "storage.googleapis.com",
  "cloudbuild.googleapis.com",
  "cloudfunctions.googleapis.com"

]

