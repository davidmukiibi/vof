provider "google" {
  credentials = "${file("service-account.json")}"
  project = "${var.project_id}"
  region = "${var.region}"
}

terraform {
  backend "gcs" {
    bucket = "vof-tfstate-david"
    project = "vof-testbed-2"
    credentials = "service-account.json"
  }
}

data "terraform_remote_state" "vof" {
  backend = "gcs"
  config {
    bucket = "vof-tfstate-david"
    path = "${var.state_path}"
    project = "vof-testbed-2"
    credentials = "service-account.json"
  }
}
