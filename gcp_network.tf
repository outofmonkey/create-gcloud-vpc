resource "google_compute_network" "vpc_terraform" {
  name                    = "vpc-terraform"
  auto_create_subnetworks = false
  project                 = data.google_project.acgproject.project_id
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet_terraform" {
  name          = "subnet-terraform01"
  ip_cidr_range = "192.168.0.0/20"
  region        = "us-west1"
  project       = data.google_project.acgproject.project_id
  network       = google_compute_network.vpc_terraform.id
  secondary_ip_range {
    range_name    = "public-subnet-terraform01"
    ip_cidr_range = "192.168.16.0/24"  # Fixed to avoid overlap
  }
  secondary_ip_range {
    range_name    = "private-subnet-terraform02"
    ip_cidr_range = "192.168.32.0/24"  # Fixed to avoid overlap
  }
#   VPC Flow Logs
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}