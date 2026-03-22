resource "google_sql_database_instance" "primary" {
  name             = "${var.name}-primary"
  region           = var.primary_region
  database_version = "POSTGRES_15"
  settings {
    tier              = var.tier
    availability_type = "REGIONAL" # HA within the region
    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }
  }
}

resource "google_sql_database_instance" "replica" {
  count                = var.enable_replica ? 1 : 0
  name                 = "${var.name}-replica"
  region               = var.replica_region
  master_instance_name = google_sql_database_instance.primary.name
  settings { tier = var.tier }
}