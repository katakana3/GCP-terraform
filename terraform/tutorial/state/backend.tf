terraform {
  backend "gcs" {
    bucket = "bucket-tfstate-a14f3591a8619f4d"
    prefix = "terraform/state"
  }
}