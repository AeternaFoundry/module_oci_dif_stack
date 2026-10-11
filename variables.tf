variable "dif_stacks" {
  description = <<EOT
Map of dif_stacks, attributes below
Required:
    - compartment_id
    - display_name
    - services
    - stack_templates
Optional:
    - add_service_trigger
    - defined_tags
    - deploy_artifacts_trigger
    - freeform_tags
    - notification_email
    - subnet_id
    - adb (block):
        - admin_password_id (required)
        - artifact_object_storage_path (optional)
        - data_storage_size_in_tbs (required)
        - db_credentials (optional, block):
            - secret_id (required)
            - user_name (required)
            - user_type (required)
        - db_version (required)
        - db_workload (required)
        - ecpu (required)
        - instance_id (required)
        - is_mtls_connection_required (optional)
        - is_public (optional)
        - subnet_id (optional)
        - tools_public_access (optional)
    - aidataplatform (block):
        - default_workspace_name (required)
        - instance_id (required)
    - dataflow (block):
        - archive_uri (optional)
        - connections (optional, block):
            - connection_details (required, block):
                - dif_dependencies (optional, block):
                    - service_instance_id (required)
                    - service_type (required)
                - domain_names (optional)
            - subnet_id (required)
        - driver_shape (required)
        - driver_shape_config (optional, block):
            - memory_in_gbs (required)
            - ocpus (required)
        - execute (optional)
        - executor_shape (required)
        - executor_shape_config (optional, block):
            - memory_in_gbs (required)
            - ocpus (required)
        - instance_id (required)
        - log_bucket_instance_id (required)
        - num_executors (required)
        - private_endpoint_id (optional)
        - spark_version (required)
        - warehouse_bucket_instance_id (optional)
    - genai (block):
        - base_model (required)
        - cluster_type (required)
        - endpoints (optional, block):
            - endpoint_name (required)
            - is_content_moderation_enabled (required)
        - instance_id (required)
        - oci_region (required)
        - unit_count (required)
    - ggcs (block):
        - artifact_object_storage_path (optional)
        - connections (optional, block):
            - connection_id (optional)
            - connection_name (required)
            - dif_dependencies (optional, block):
                - service_instance_id (required)
                - service_type (required)
            - gg_admin_secret_id (optional)
        - instance_id (required)
        - ocpu (required)
        - ogg_version (optional)
        - password_secret_id (required)
        - public_subnet_id (optional)
        - sources (optional, block):
            - action (required)
            - should_start_source_operations (required)
            - source_id (required)
            - target_connection_name (optional)
            - target_uri (optional)
        - subnet_id (required)
        - targets (optional, block):
            - action (required)
            - should_start_target_operations (required)
            - source_connection_name (optional)
            - source_uri (optional)
            - target_id (required)
        - users (optional, block):
            - action (required)
            - secret_id (required)
            - user_name (required)
            - user_type (required)
    - objectstorage (block):
        - auto_tiering (optional)
        - instance_id (required)
        - object_versioning (required)
        - storage_tier (required)
    - oke (block):
        - cluster_id (required)
        - component_value_overrides (optional, block):
            - component_name (required)
            - value_overrides (required)
        - instance_id (required)
        - manifest_object_storage_path (optional)
        - namespace_name (required)
        - secrets (optional, block):
            - secret_data (required, block):
                - key (required)
                - secret_id (required)
            - secret_name (required)
            - template_object_storage_path (optional)
    - omk (block):
        - cluster_id (required)
        - cluster_namespace_id (required)
        - component_value_overrides (optional, block):
            - component_name (required)
            - value_overrides (required)
        - instance_id (required)
        - manifest_object_storage_path (optional)
        - namespace_name (required)
        - secrets (optional, block):
            - secret_data (required, block):
                - key (required)
                - secret_id (required)
            - secret_name (required)
            - template_object_storage_path (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id           = string
    display_name             = string
    services                 = set(string)
    stack_templates          = set(string)
    add_service_trigger      = optional(number)
    defined_tags             = optional(map(string))
    deploy_artifacts_trigger = optional(number)
    freeform_tags            = optional(map(string))
    notification_email       = optional(string)
    subnet_id                = optional(string)
    adb = optional(list(object({
      admin_password_id            = string
      artifact_object_storage_path = optional(string)
      data_storage_size_in_tbs     = number
      db_credentials = optional(list(object({
        secret_id = string
        user_name = string
        user_type = string
      })))
      db_version                  = string
      db_workload                 = string
      ecpu                        = number
      instance_id                 = string
      is_mtls_connection_required = optional(bool)
      is_public                   = optional(bool)
      subnet_id                   = optional(string)
      tools_public_access         = optional(string)
    })))
    aidataplatform = optional(list(object({
      default_workspace_name = string
      instance_id            = string
    })))
    dataflow = optional(list(object({
      archive_uri = optional(string)
      connections = optional(object({
        connection_details = object({
          dif_dependencies = optional(list(object({
            service_instance_id = string
            service_type        = string
          })))
          domain_names = optional(set(string))
        })
        subnet_id = string
      }))
      driver_shape = string
      driver_shape_config = optional(object({
        memory_in_gbs = number
        ocpus         = number
      }))
      execute        = optional(string)
      executor_shape = string
      executor_shape_config = optional(object({
        memory_in_gbs = number
        ocpus         = number
      }))
      instance_id                  = string
      log_bucket_instance_id       = string
      num_executors                = number
      private_endpoint_id          = optional(string)
      spark_version                = string
      warehouse_bucket_instance_id = optional(string)
    })))
    genai = optional(list(object({
      base_model   = string
      cluster_type = string
      endpoints = optional(list(object({
        endpoint_name                 = string
        is_content_moderation_enabled = bool
      })))
      instance_id = string
      oci_region  = string
      unit_count  = number
    })))
    ggcs = optional(list(object({
      artifact_object_storage_path = optional(string)
      connections = optional(list(object({
        connection_id   = optional(string)
        connection_name = string
        dif_dependencies = optional(list(object({
          service_instance_id = string
          service_type        = string
        })))
        gg_admin_secret_id = optional(string)
      })))
      instance_id        = string
      ocpu               = number
      ogg_version        = optional(string)
      password_secret_id = string
      public_subnet_id   = optional(string)
      sources = optional(list(object({
        action                         = string
        should_start_source_operations = bool
        source_id                      = string
        target_connection_name         = optional(string)
        target_uri                     = optional(string)
      })))
      subnet_id = string
      targets = optional(list(object({
        action                         = string
        should_start_target_operations = bool
        source_connection_name         = optional(string)
        source_uri                     = optional(string)
        target_id                      = string
      })))
      users = optional(list(object({
        action    = string
        secret_id = string
        user_name = string
        user_type = string
      })))
    })))
    objectstorage = optional(list(object({
      auto_tiering      = optional(string)
      instance_id       = string
      object_versioning = string
      storage_tier      = string
    })))
    oke = optional(list(object({
      cluster_id = string
      component_value_overrides = optional(list(object({
        component_name  = string
        value_overrides = map(string)
      })))
      instance_id                  = string
      manifest_object_storage_path = optional(string)
      namespace_name               = string
      secrets = optional(list(object({
        secret_data = list(object({
          key       = string
          secret_id = string
        }))
        secret_name                  = string
        template_object_storage_path = optional(string)
      })))
    })))
    omk = optional(list(object({
      cluster_id           = string
      cluster_namespace_id = string
      component_value_overrides = optional(list(object({
        component_name  = string
        value_overrides = map(string)
      })))
      instance_id                  = string
      manifest_object_storage_path = optional(string)
      namespace_name               = string
      secrets = optional(list(object({
        secret_data = list(object({
          key       = string
          secret_id = string
        }))
        secret_name                  = string
        template_object_storage_path = optional(string)
      })))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dif_stacks : (
        v.oke == null || alltrue([for item in v.oke : (item.secrets == null || alltrue([for item in item.secrets : (length(item.secret_data) >= 1)]))])
      )
    ])
    error_message = "Each secret_data list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dif_stacks : (
        v.omk == null || alltrue([for item in v.omk : (item.secrets == null || alltrue([for item in item.secrets : (length(item.secret_data) >= 1)]))])
      )
    ])
    error_message = "Each secret_data list must contain at least 1 items"
  }
}

