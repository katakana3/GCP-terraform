provider "google" {
  credentials = file("~/.ssh/katakana-tr-terraform.json")

  project = "katakana-tr"
  region  = "us-west1"
  zone    = "us-west1-a"
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "bucket-tfstate-${random_id.instance_id.hex}"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
// Terraform plugin for creating random IDs
resource "random_id" "instance_id" {
  byte_length = 8
}
