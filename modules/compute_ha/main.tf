resource "google_compute_instance_template" "tpl" {
  name_prefix  = "${var.name}-template-"
  machine_type = var.machine_type
  disk { source_image = var.image }
  network_interface { network = var.network }
  lifecycle { create_before_destroy = true }
}

resource "google_compute_region_instance_group_manager" "mig" {
  name               = "${var.name}-mig"
  region             = var.region
  base_instance_name = var.name
  target_size        = var.target_size

  version {
    instance_template = google_compute_instance_template.tpl.id
  }
}