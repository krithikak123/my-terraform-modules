# HA Compute in Primary Region
module "app_primary" {
  source      = "./modules/compute_ha"
  name        = "web-prod"
  region      = "us-central1"
  target_size = 3
}

# DR SQL: Primary in us-central1, Replica in us-east1
module "db_prod" {
  source         = "./modules/sql_dr"
  name           = "prod-db"
  primary_region = "us-central1"
  replica_region = "us-east1"
  enable_replica = true
}