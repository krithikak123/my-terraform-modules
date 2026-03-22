terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0" # Lock the version for stability
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.primary_region
}

provider "google" {
  alias   = "secondary"
  project = var.project_id
  region  = var.secondary_region
}
