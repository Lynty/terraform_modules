variable "project_id" {
  description = "The project ID to deploy resources into"
}

variable "subnetwork_project" {
  description = "The project ID where the desired subnetwork is provisioned"
}

variable "subnetwork" {
  description = "The name of the subnetwork to deploy instances into"
}

variable "instance_name" {
  description = "The desired name to assign to the deployed instance"
}

variable "zone" {
  description = "The GCP zone to deploy instances into"
  default     = "us-west1-b"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy instances into"
  default     = "us-west1"
  type        = string
}

variable "machine_type" {
  description = "The GCE machine type to use"
  default     = "n1-standard-1"
  type        = string
}

variable "client_email" {
  description = "Service account email address"
  type        = string
  default     = ""
}

variable "container_image_name" {
  description = "The name of the container image"
}

variable "container_env_vars" {
  description = <<EOF
  List of environment variable mappings with the following structure:
    [{
      name  = "ENV_VAR_NAME"
      value = "ENV_VAR_VALUE"
    }]
  EOF
}

variable "cos_image_name" {
  description = "The forced COS image to use instead of latest"
  default     = "cos-stable-97-16919-29-21"
}

