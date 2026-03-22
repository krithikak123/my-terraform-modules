variable "project_id" {
  description = "The GCP project ID where resources will be deployed."
  type        = string
}

variable "primary_region" {
  description = "The primary region for high-availability compute and database resources."
  type        = string
  default     = "us-central1"
}

variable "secondary_region" {
  description = "The secondary region used for disaster recovery (DR) replicas."
  type        = string
  default     = "us-east1"
}

variable "machine_type" {
  description = "The machine type to use for Compute Engine instances."
  type        = string
  default     = "e2-medium"
}

variable "db_tier" {
  description = "The machine tier for the Cloud SQL instance."
  type        = string
  default     = "db-f1-micro"
}

variable "network_name" {
  description = "The VPC network name to associate with the resources."
  type        = string
  default     = "default"
}