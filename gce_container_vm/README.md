Module to [run containers on Compute Engine VMs](https://cloud.google.com/compute/docs/containers).

## Example Usage

```
module "config_server" {
  source               = "git@github.com:Lynty/terraform_modules.git//gce_container_vm"
  project_id           = "my-project-id"
  subnetwork_project   = "shared-vpc-dev"
  subnetwork           = "us-west1-subnet-1"
  instance_name        = "hello-world-vm"
  container_image_name = "gcr.io/cloudrun/hello"
  container_env_vars = [
    {
      name = "INSTANCE_NAME"
      value = "hello-world-vm"
    }
  ]
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.21.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_container_info"></a> [container\_info](#module\_container\_info) | terraform-google-modules/container-vm/google | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_email"></a> [client\_email](#input\_client\_email) | Service account email address | `string` | `""` | no |
| <a name="input_container_env_vars"></a> [container\_env\_vars](#input\_container\_env\_vars) | List of environment variable mappings with the following structure:<br>    [{<br>      name  = "ENV\_VAR\_NAME"<br>      value = "ENV\_VAR\_VALUE"<br>    }] | `any` | n/a | yes |
| <a name="input_container_image_name"></a> [container\_image\_name](#input\_container\_image\_name) | The name of the container image | `any` | n/a | yes |
| <a name="input_cos_image_name"></a> [cos\_image\_name](#input\_cos\_image\_name) | The forced COS image to use instead of latest | `string` | `"cos-stable-97-16919-29-21"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The desired name to assign to the deployed instance | `any` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The GCE machine type to use | `string` | `"n1-standard-1"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to deploy resources into | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region to deploy instances into | `string` | `"us-west1"` | no |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The name of the subnetwork to deploy instances into | `any` | n/a | yes |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | The project ID where the desired subnetwork is provisioned | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The GCP zone to deploy instances into | `string` | `"us-west1-b"` | no |

## Outputs

No outputs.
