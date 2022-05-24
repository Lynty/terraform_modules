module "container_info" {
  source         = "terraform-google-modules/container-vm/google"
  version        = "~> 2.0"
  cos_image_name = var.cos_image_name

  container = {
    image = var.container_image_name
    env   = var.container_env_vars
  }
  restart_policy = "Always"
}

locals {
  instance_name = format("%s-%s", var.instance_name, substr(md5(module.container_info.container.image), 0, 8))
}

resource "google_compute_instance" "vm" {
  project      = var.project_id
  name         = local.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = module.container_info.source_image
    }
  }

  network_interface {
    subnetwork_project = var.subnetwork_project
    subnetwork         = var.subnetwork
    network_ip         = ""
  }

  metadata = {
    gce-container-declaration = module.container_info.metadata_value
    google-logging-enabled    = "true"
    google-monitoring-enabled = "true"
  }

  labels = {
    container-vm = module.container_info.vm_container_label
  }
}
